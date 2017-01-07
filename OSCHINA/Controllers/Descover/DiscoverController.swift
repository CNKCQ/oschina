//
//  Created by KingCQ on 16/8/12.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class DiscoverController: BaseController, UITableViewDelegate {

    var tableView: UITableView!
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>>()

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView = UITableView(frame: view.bounds, style: .grouped)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell))
//        let dataSource = self.dataSource
//        let items = Observable.just([
//            SectionModel(model: "", items: [
//                "开源软件"
//                ]),
//            SectionModel(model: "", items: [
//                "找人"
//                ]),
//            SectionModel(model: "", items: [
//                "扫一扫",
//                "摇一摇"
//                ])
//            ])
//
//        dataSource.configureCell = { (_, tableView, indexPath, element) in
//            let cell = tableViedequeueReusableCellewithIdentifier: r(String(UITableViewCell))!
//            cell.textLabel?.text = element
//            cell.accessoryType = .DisclosureIndicator
//            return cell
//        }
//        items
//            .bindTo(tableView.rx_itemsWithDataSource(dataSource))
//            .addDisposableTo(disposeBag)
//
//        tableView
//            .rx_itemSelected
//            .map { indexPath in
//                return (indexPath, dataSource.itemAtIndexPath(indexPath))
//            }
//            .subscribeNext { indexPath, model in
////                DefaultWireframe.presentAlert("taped @ \(model)")
//                let dest = FindUserController()
//                self.navigationController?.pushViewController(dest, animated: false)
//            }
//            .addDisposableTo(disposeBag)
//
//        tableView
//            .rx_setDelegate(self)
//            .addDisposableTo(disposeBag)
//
//        view.addSubview(tableView)
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let label = UILabel(frame: CGRect.zero)
//        label.text = dataSource.sectionAtIndex(section).model ?? ""
//        return label
//    }
}
