//
//  Created by KingCQ on 16/9/12.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

class FindUserController: BaseController {
    private lazy var disposeBag = DisposeBag()
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
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: String(UITableViewCell))
        tableView.delegate = self
        tableView.dataSource = self
//        let viewModel = FindViewModel()
//        searchBar.rx_text.asDriver().throttle(0.3).distinctUntilChanged().flatMapLatest { text  in
//            viewModel.search(text).retry(3).retryOnBecomesReachable([], reachabilityService: Dependencies.sharedDependencies.reachabilityService).startWith([]).asDriver(onErrorJustReturn: [])
//        }
        searchBar.delegate = self

        tableView.tableFooterView = UIView()
        view.addSubview(searchBar)
        view.addSubview(tableView)



    }
}

extension FindUserController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let  item = items {
            return item.count
        }
        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(UITableViewCell))!
        let url = NSURL(string: items![indexPath.row].portrait!)!
        cell.imageView?.kf_setImageWithURL(url)
        cell.textLabel?.text = items![indexPath.row].name
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        searchBar.resignFirstResponder()
    }

    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
}

extension FindUserController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let viewModel = FindViewModel()
            if let text = searchBar.text {
            viewModel.search(text).subscribe(
                onNext: { entities in
                    self.items = entities
                }, onError: { error in
                    log.info("\(error)")
                }, onCompleted: {
                    log.info("completed")
                }, onDisposed: {
                    log.info("disposed")
            }).addDisposableTo(disposeBag)
        }
    }
}
