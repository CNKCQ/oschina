//
//  SettingController.swift
//  OSCHINA
//
//  Created by KingCQ on 2017/1/7.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class SettingController: BaseViewController {
    var tableView: UITableView!
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>>()
    let items = Observable.just([
        SectionModel(model: "title", items: [
            "我的消息",
            "我的博客",
        ]),
        SectionModel(model: "title1", items: [
            "我的问答",
            "我的活动",
        ]),
        SectionModel(model: "title2", items: [
            "我的团队",
        ]),
    ])

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "设置"
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        let dataSource = self.dataSource
        dataSource.configureCell = { _, tableView, _, element in
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self))!
            cell.textLabel?.text = element
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        items.bindTo(tableView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)

        tableView.rx.modelSelected(String.self).subscribe(onNext: { item in
            print(item, "🌹")
        }).addDisposableTo(disposeBag)
    }
}
