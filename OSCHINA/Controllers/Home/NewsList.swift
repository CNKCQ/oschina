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
        layout.itemSize = CGSize(width: view.bounds.width, height: 0)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.height = view.height - 49 - 40 - 64
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        collectionView.register(cellType: NewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.register(supplementaryViewType: NewsHeader.self, ofKind: UICollectionElementKindSectionHeader)
        let viewModel = NewsViewModel()
        viewModel.fetch().subscribe(
            onNext: { entities in
                if let result = entities {
                    self.newsItems = result
                }
            }).addDisposableTo(self.disposeBag)
    }

}

extension NewsList: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: NewCell.self)
        cell.set(with: newsItems[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = NewsLayout(newsItems[indexPath.item])
        return CGSize(width: SCREEN_WIDTH, height: layout.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, for: indexPath, viewType: NewsHeader.self) as NewsHeader
            let imageUrls = ["http://ww3.sinaimg.cn/large/610dc034jw1f4saelbb4oj20zk0qoage.jpg", "http://ww1.sinaimg.cn/mw690/692a6bbcgw1f4fz7s830fj20gg0o00y5.jpg", "http://ww1.sinaimg.cn/mw690/692a6bbcgw1f4fz6g6wppj20ms0xp13n.jpg", "http://ww3.sinaimg.cn/mw690/81309c56jw1f4sx4ybttdj20ku0vd0ym.jpg", "http://ww4.sinaimg.cn/mw690/9844520fjw1f4fqribdg1j21911w0kjn.jpg"]
            header.banner.configAd(imageUrls, style: .right, response: { index in
                print(index, "🌹")
            })
            return header
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: SCREEN_WIDTH, height: 180)
    }
    
}
