//
//  Created by KingCQ on 16/9/12.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class FindUserController: BaseController {

    var tableView: UITableView!
    var searchBar: UISearchBar!
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, FindObjList>>()
    var items: [FindObjList]? = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 64, width: view.width, height: 44))
        searchBar.placeholder = "请输入用户昵称"
        tableView = UITableView(frame: view.bounds)
        tableView.y = searchBar.bottom
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell()))
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self

        tableView.tableFooterView = UIView()
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
}

extension FindUserController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        if let item = items {
            return item.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell()))!
        let url = URL(string: items![indexPath.row].portrait!)!
        _ = cell.imageView?.setImageWithURL(url)
        cell.textLabel?.text = items![indexPath.row].name
        return cell
    }

    func tableView(_: UITableView, didSelectRowAt _: IndexPath) {
        searchBar.resignFirstResponder()
    }

    func scrollViewWillBeginDragging(_: UIScrollView) {
        searchBar.resignFirstResponder()
    }
}

extension FindUserController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_: UISearchBar) {
        //        let viewModel = FindViewModel()
        //            if let text = searchBar.text {
        //            viewModel.search(text).subscribe(
        //                onNext: { entities in
        //                    self.items = entities
        //                }, onError: { error in
        ////                    log.info("\(error)")
        //                }, onCompleted: {
        ////                    log.info("completed")
        //                }, onDisposed: {
        ////                    log.info("disposed")
        //            }).addDisposableTo(disposeBag)
        //        }
    }
}
