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
import Kingfisher

private let tableViewOffset: CGFloat = UIScreen.mainScreen().bounds.height < 600 ? 89 : 95
private let beforeAppearOffset: CGFloat = 0

class MineController: BaseController {
    private lazy var disposeBag = DisposeBag()
    var tableView: UITableView!
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>>()
    var loginButton: UIButton!
    var backgroundView: UIView!
    var backgroundImageView: UIImageView!
    var avartView: UIImageView!
    let items = Observable.just([
        SectionModel(model: "", items: [
            "我的消息",
            "我的博客"
            ]),
        SectionModel(model: "", items: [
            "我的活动",
            "我的团队"
            ]),
        SectionModel(model: "", items: [
            "设置"
            ])
        ])

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.contentInset = UIEdgeInsets(top: tableViewOffset, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -beforeAppearOffset)
        UIView.animateWithDuration(0.5, animations: {
            self.tableView.contentOffset = CGPoint(x: 0, y: -tableViewOffset)
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .None
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height))
        backgroundView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        tableView = UITableView(frame: view.bounds, style: .Grouped)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        backgroundImageView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: backgroundView.width, height: 500)))
        backgroundImageView.contentMode = .ScaleAspectFill
        backgroundImageView.image = UIImage(named: "Photo_light")
        backgroundImageView.centerX = backgroundView.centerX
        backgroundView.addSubview(backgroundImageView)
        tableView.backgroundView = backgroundView
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: String(UITableViewCell))
        let dataSource = self.dataSource
        dataSource.configureCell = { (_, tableView, indexPath, element) in
            let cell = tableView.dequeueReusableCellWithIdentifier(String(UITableViewCell))!
            cell.textLabel?.text = element
            cell.accessoryType = .DisclosureIndicator
            return cell
        }
        items
            .bindTo(tableView.rx_itemsWithDataSource(dataSource))
            .addDisposableTo(disposeBag)

        tableView
            .rx_itemSelected
            .map { indexPath in
                return (indexPath, dataSource.itemAtIndexPath(indexPath))
            }
            .subscribeNext { indexPath, model in
                DefaultWireframe.presentAlert("taped @ \(model)")
            }
            .addDisposableTo(disposeBag)
        tableView
            .rx_setDelegate(self)
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
        loginButton.rx_tap.subscribeNext ({ [weak self] in
            self?.login()
        }).addDisposableTo(disposeBag)
        headerView.addSubview(avartView)
        headerView.addSubview(loginButton)
        loginButton.setTitle("登录", forState: .Normal)
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = headerView
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: 100))
        footerView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        tableView.tableFooterView = footerView
        view.addSubview(tableView)
    }

    func login() {
        let dest = LoginController()
        dest.destBack = { user in
            if let url = NSURL(string: user!.portrait!) {
                self.avartView.setImageWithURL(url)
            }
            self.loginButton.setTitle(user?.name, forState: .Normal)
        }
        navigationController?.pushViewController(dest, animated: true)
    }
}

extension MineController: UITableViewDelegate {
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect.zero)
        return label
    }

    func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.backgroundColor = UIColor.groupTableViewBackgroundColor()
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(FLT_MIN)
    }
}

extension MineController {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        backgroundImageView.height = max(navigationController!.navigationBar.bounds.height + scrollView.contentInset.top - scrollView.contentOffset.y, 0)
        backgroundImageView.width = max(navigationController!.navigationBar.bounds.height - scrollView.contentInset.top - scrollView.contentOffset.y * 0.8, view.width)
    }
}
