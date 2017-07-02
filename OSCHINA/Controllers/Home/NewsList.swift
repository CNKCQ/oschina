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
import RxDataSources
import UI_
import Foundation_

class NewsList: CollectionList<NewCell>, UICollectionViewDelegateFlowLayout {

    let viewModel = NewsViewModel()

    var newsItems: [NewsObjList] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    var bannerItems: [BannerItem]? = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override var layout: UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.width, height: 0)
        return layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "综合"
        collectionView.register(supplementaryViewType: NewsHeader.self, ofKind: UICollectionElementKindSectionHeader)
    }

    override func numberOfItemsIn(_: Int) -> Int {
        return newsItems.count
    }

    override func cell(_ cell: NewCell, indexPath: IndexPath) {
        cell.set(with: newsItems[indexPath.row])
    }

    override func refresh() {

//        let items = Observable.just([
//            "First Item",
//            "Second Item",
//            "Third Item"
//            ])

//        items
//            .bind(to: tableView.rx.items) { (tableView, row, element) in
//                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
//                cell.textLabel?.text = "\(element) @ row \(row)"
//                return cell
//            }
//            .disposed(by: disposeBag)

        let tableView = UITableView(frame: view.bounds)
        viewModel.newsArr().bind(to: tableView.rx.items(cellIdentifier: UITableViewCell.reuseIdentifier, cellType: UITableViewCell.self)) { _, new, cell in
            cell.textLabel?.text = new.body
        }.addDisposableTo(disposeBag)

        viewModel.newsArr().bind(to: tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(for:  IndexPath(row: row, section: 0), cellType: UITableViewCell.self)
            return cell
        }.addDisposableTo(disposeBag)

        viewModel.banner().subscribe(onNext: { result in
            self.bannerItems = result.result?.items
        }).addDisposableTo(disposeBag)
        viewModel.news().subscribe(onNext: { result in
            self.newsItems = result.objList ?? []
        }).addDisposableTo(disposeBag)
    }

    override func loadMore() {
        //        viewModel.loadMore().subscribe(
        //            onNext: { result in
        //                self.newsItems += result.0
        //                self.bannerItems = result.1
        //        })
        //            .addDisposableTo(self.disposeBag)
    }

    override func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router(intentType: WebController.self, para: newsItems[indexPath.row].url ?? "", style: .push)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = NewsLayout(newsItems[indexPath.item])
        return CGSize(width: screenWidth, height: layout.height)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, for: indexPath, viewType: NewsHeader.self) as NewsHeader
            if let banners = bannerItems {
                let imagUrls = banners.flatMap({ $0.img })
                let titles = banners.flatMap({ $0.name })
                header.banner.imagUrls = imagUrls
                header.banner.titles = titles
                header.banner.pageControlAlignment = .right
                header.banner.callback = { [weak self] index in
                    let dest = WebController()
                    dest.title = titles[index]
                    dest.urlStr = banners[index].href ?? ""
                    self?.navigationController?.pushViewController(dest, animated: true)
                }
            }
            return header
        }
        return UICollectionReusableView()
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, referenceSizeForHeaderInSection _: Int) -> CGSize {
        return CGSize(width: screenWidth, height: 180)
    }
}
