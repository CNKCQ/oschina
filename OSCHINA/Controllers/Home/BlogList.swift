//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/3.
//

import UIKit
import Moya
import ObjectMapper
import RxSwift


class BlogList: BaseController {
    let disposeBag = DisposeBag()
    var blogItems: [BlogObjList] = [] {
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
        tableView.register(cellType: NewCell.self)
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        tableView.height = view.height - 49 - 40 - 64
        tableView.separatorStyle = .none
        view.addSubview(tableView)
//        let viewModel = BlogViewModel()
//        viewModel.fetch().subscribe(
//            onNext: { entities in
//                self.blogItems = entities!
////                log.info("你好")
//            }, onError: { error in
////                log.error("\(error)")
//            }, onCompleted: {
////                log.info("completed")
//            }, onDisposed: {
////                log.info("disposed")
//
//        }).addDisposableTo(self.disposeBag)
    }

}

extension BlogList: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: NewCell.self)
            cell.titleLabel?.text = blogItems[indexPath.row].title
            cell.contentLabel?.text = blogItems[indexPath.row].body
            cell.setNeedsUpdateConstraints()
            cell.updateConstraintsIfNeeded()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dest = WebController()
        dest.urlStr = blogItems[indexPath.row].url
        dest.title = blogItems[indexPath.row].title
        navigationController?.pushViewController(dest, animated: true)
    }
}
