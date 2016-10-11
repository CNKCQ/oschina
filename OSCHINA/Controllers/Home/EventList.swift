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
        self.view.backgroundColor = UIColor.whiteColor()
        tableView = UITableView(frame: view.bounds, style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerReusableCell(EventCell)
        tableView.tableFooterView = UIView()
        tableView.height = view.height - 49 - 40 - 64
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        view.addSubview(tableView)
        let viewModel = EventViewModel()
        viewModel.fetch().subscribe(
            onNext: { entities in
                self.eventItems = entities!
                log.info("你好")
            }, onError: { error in
                log.error("\(error)")
            }, onCompleted: {
                log.info("completed")
            }, onDisposed: {
                log.info("disposed")

        }).addDisposableTo(self.disposeBag)
    }
}

extension EventList: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as EventCell

        if let url = NSURL(string: eventItems[indexPath.row].cover!) {
            cell.iconView.setImageWithURL(url)
        }
        cell.titleLabel?.text = eventItems[indexPath.row].title
        cell.contentLabel?.text = eventItems[indexPath.row].url
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dest = WebController()
        dest.urlStr = eventItems[indexPath.row].url
        dest.title = eventItems[indexPath.row].title
        navigationController?.pushViewController(dest, animated: true)
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
}
