//
//  MineController.swift
//  OSCHINA
//
//  Created by KingCQ on 16/8/12.
//  Copyright © 2016年 KingCQ. All rights reserved.
//
import UIKit
import RxCocoa
import RxSwift
import RxDataSources
//import Kingfisher

private let tableViewOffset: CGFloat = UIScreen.main.bounds.height < 600 ? 89 : 95
private let beforeAppearOffset: CGFloat = 0

class MineController: BaseController {
    var tableView: UITableView!
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>>()
    var loginButton: UIButton!
    var backgroundView: UIView!
    var backgroundImageView: UIImageView!
    var avartView: UIImageView!
    let items = Observable.just([
        SectionModel(model: "title", items: [
            "扫一扫",
            "摇一摇"
            ]),
        SectionModel(model: "title1", items: [
            "开源软件",
            "线下活动"
            ]),
        SectionModel(model: "title2", items: [
            "设置"
            ])
        ])

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.contentInset = UIEdgeInsets(top: tableViewOffset, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -beforeAppearOffset)
        UIView.animate(withDuration: 0.5, animations: {
            self.tableView.contentOffset = CGPoint(x: 0, y: -tableViewOffset)
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge()
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height))
        backgroundView.backgroundColor = UIColor.groupTableViewBackground
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        backgroundImageView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: backgroundView.width, height: 500)))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = UIImage(named: "Photo_light")
        backgroundImageView.centerX = backgroundView.centerX
        backgroundView.addSubview(backgroundImageView)
        tableView.backgroundView = backgroundView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        let dataSource = self.dataSource
        dataSource.configureCell = { (_, tableView, indexPath, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self))!
            cell.textLabel?.text = element
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        items.bindTo(tableView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)
        
        tableView.rx.modelSelected(String.self).subscribe(onNext: { item in
            switch item {
            case "设置":
                self.startActivity(SettingController())
            default: break
            }
            }).addDisposableTo(disposeBag)
        tableView
            .rx.setDelegate(self)
            .addDisposableTo(disposeBag)
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: 120))
        avartView = UIImageView()
        avartView.size = CGSize(width: 64, height: 64)
        avartView.centerX = headerView.centerX
        avartView.layer.cornerRadius = avartView.width / 2
        avartView.layer.masksToBounds = true
        avartView.image = UIImage(named: "default-portrait")
        loginButton = UIButton(frame: CGRect(x: 15, y: avartView.bottom, width: view.bounds.width / 2, height: 25))
        avartView.addAction(self, action: #selector(login))
        loginButton.centerX = headerView.centerX
        loginButton.addAction(self, action: #selector(login))
//        loginButton.rx_tap.subscribeNext ({ [weak self] in
//            self?.login()
//        }).addDisposableTo(disposeBag)
        headerView.addSubview(avartView)
        headerView.addSubview(loginButton)
        loginButton.setTitle("登录", for: UIControlState())
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = headerView
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: 100))
        footerView.backgroundColor = UIColor.groupTableViewBackground
        tableView.tableFooterView = footerView
        view.addSubview(tableView)
    }

    func login() {
//        let dest = LoginController()
//        dest.destBack = { user in
//            if let url = URL(string: user!.portrait!) {
//                _ = self.avartView.setImageWithURL(url)
//            }
//            self.loginButton.setTitle(user?.name, for: UIControlState())
//        }
//        navigationController?.pushViewController(dest, animated: true)
    }
}

extension MineController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect.zero)
        return label
    }

    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.backgroundColor = UIColor.groupTableViewBackground
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(FLT_MIN)
    }
}

extension MineController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        backgroundImageView.height = max(navigationController!.navigationBar.bounds.height + scrollView.contentInset.top - scrollView.contentOffset.y, 0)
        backgroundImageView.width = max(navigationController!.navigationBar.bounds.height - scrollView.contentInset.top - scrollView.contentOffset.y * 0.8, view.width)
    }
}
