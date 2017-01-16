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

class NewsList: CollectionList<NewCell>, UICollectionViewDelegateFlowLayout {
    
    let viewModel = NewsViewModel()
    let bannerModel = BannerViewModel()

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
    
    override func numberOfItemsIn(_ section: Int) -> Int {
        return newsItems.count
    }
    
    override func cell(_ cell: NewCell, indexPath: IndexPath) {
        cell.set(with: newsItems[indexPath.row])
    }
    
    override func refresh() {
        viewModel.fetch().subscribe(
            onNext: { result in
            self.newsItems = result.0
            self.bannerItems = result.1
        })
            .addDisposableTo(self.disposeBag)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dest = WebController()
        dest.urlStr = newsItems[indexPath.row].href
        self.navigationController?.pushViewController(dest, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = NewsLayout(newsItems[indexPath.item])
        return CGSize(width: SCREEN_WIDTH, height: layout.height)
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
                    dest.urlStr = banners[index].href
                    self?.navigationController?.pushViewController(dest, animated: true)
                }
            }
            return header
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: SCREEN_WIDTH, height: 180)
    }
    
}
