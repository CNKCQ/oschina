//
//  TweetController.swift
//  OSCHINA
//
//  Created by KingCQ on 16/8/12.
//  Copyright © 2016年 KingCQ. All rights reserved.
//
import UIKit
import Kingfisher
import ObjectMapper
import RxSwift

class TweetController: BaseController {
    var tableView: UITableView!
    let disposeBag = DisposeBag()
    var tweets: [TweetObjList] = [] {
        didSet {
            tableView.reloadData()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerReusableCell(TweetCell)
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
//        let viewModel = TweetViewModel()
//        viewModel.fetch().subscribe(
//            onNext: { entities in
//                self.tweets = entities!
//            }, onError: { error in
//                log.info("\(error)")
//            }, onCompleted: {
//                log.info("completed")
//            }, onDisposed: {
//                log.info("disposed")
//
//        }).addDisposableTo(self.disposeBag)
    }
}

extension TweetController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return tweets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(indexPath: indexPath) as TweetCell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as? TweetCell
        let data = tweets[indexPath.row]
        cell?.imageView?.setImageWithURL(URL(string: data.author!.portrait!)!, placeholderImage: UIImage(named: "ic_me_avart_default"), optionsInfo: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
            cell?.imageView?.image = image?.cs_imageWithCornerRadius(29 / 2, sizeToFit: CGSize(width: 29, height: 29))
        })
        cell?.textLabel?.text = data.author?.name
        cell?.detailTextLabel?.text = data.body
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TABLE_VIEW_BIGROW_HEIGHT
    }
}
