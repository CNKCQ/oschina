//
//  NewsController.swift
//  OSCHINA
//
//  Created by KingCQ on 16/8/12.
//  Copyright © 2016年 KingCQ. All rights reserved.
//
import UIKit
import Moya
import ObjectMapper
import RxSwift
//import AutoCycleAdview

class NewsList: BaseController {
    let disposeBag = DisposeBag()
    var tableView: UITableView!
    var newsItems: [NewsItem] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var bannerItems: [BannerItem]? = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.groupTableViewBackground
        tableView = UITableView(frame: view.bounds)
        tableView.height = view.height - 49 - 40 - 64
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: NewCell.self)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 66
        tableView.separatorStyle = .none
        view.addSubview(tableView)
//        let headerBanner = SycleAdContainer(frame: CGRect(x: 0, y: 0, width: view.width, height: 150))
//        let bannerViewModel = BannerViewModel()
//        bannerViewModel.fetchBanner().subscribe(
//            onNext: { entities in
//                //                headerBanner.configAd(entities.fi, style: .Center) { (idx) in
//                //                    print(idx)
//                //                    print(imageUrls[idx])
//                //                }
////                log.warning(entities?.description)
//                self.bannerItems = entities
////                log.info("ok")
//
//            }, onError: { error in
////                log.error("\(error)")
//            }, onCompleted: {
////                log.info("completed")
//            }, onDisposed: {
////                log.info("disposed")
//
//        }).addDisposableTo(self.disposeBag)

        let viewModel = NewsViewModel()
        viewModel.fetch().subscribe(
            onNext: { entities in
                if let result = entities {
                    self.newsItems = result
                }
                print(entities, "🌹")
//                log.info("你好")
            }, onError: { error in
//                log.error("\(error)")
            }, onCompleted: {
//                log.info("completed")
            }, onDisposed: {
//                log.info("disposed")

        }).addDisposableTo(self.disposeBag)
    }

}

extension NewsList: UITableViewDelegate, UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: NewCell.self)
        cell.titleLabel.text = newsItems[indexPath.row].title
        cell.contentLabel.text = newsItems[indexPath.row].body
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        return cell
    }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dest = WebController()
        dest.urlStr = newsItems[indexPath.row].href
        dest.title = newsItems[indexPath.row].title
        navigationController?.pushViewController(dest, animated: true)
    }
}
