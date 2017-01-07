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
//import AutoCycleAdview

class NewsList: BaseController {

    var collectionView: UICollectionView!
    var newsItems: [NewsItem] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    var bannerItems: [BannerItem]? = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.groupTableViewBackground
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.width, height: 120)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.height = view.height - 49 - 40 - 64
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        collectionView.register(cellType: NewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
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
//                log.info("你好")
            }).addDisposableTo(self.disposeBag)
    }

}

extension NewsList: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: NewCell.self)
        cell.set(with: newsItems[indexPath.row])
        return cell
    }
}
