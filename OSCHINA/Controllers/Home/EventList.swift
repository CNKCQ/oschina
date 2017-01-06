//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/3.
//

import UIKit
import Moya
import ObjectMapper
import RxSwift


class EventList: BaseController {
    let disposeBag = DisposeBag()
    var eventItems: [EventObjList] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerReusableCell(EventCell)
        tableView.tableFooterView = UIView()
        tableView.height = view.height - 49 - 40 - 64
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        view.addSubview(tableView)
//        let viewModel = EventViewModel()
//        viewModel.fetch().subscribe(
//            onNext: { entities in
//                self.eventItems = entities!
//                log.info("你好")
//            }, onError: { error in
//                log.error("\(error)")
//            }, onCompleted: {
//                log.info("completed")
//            }, onDisposed: {
//                log.info("disposed")
//
//        }).addDisposableTo(self.disposeBag)
    }
}

extension EventList: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as EventCell

        if let url = URL(string: eventItems[indexPath.row].cover!) {
            cell.iconView.setImageWithURL(url)
        }
        cell.titleLabel?.text = eventItems[indexPath.row].title
        cell.contentLabel?.text = eventItems[indexPath.row].url
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dest = WebController()
        dest.urlStr = eventItems[indexPath.row].url
        dest.title = eventItems[indexPath.row].title
        navigationController?.pushViewController(dest, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
