//
//  CollectionList.swift
//  OSCHINA
//
//  Created by KingCQ on 2017/1/15.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources
import MJRefresh
import UI_

class CollectionList<C: CollectionCell>: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let whiteSpace = CGFloat(0.8)
    var collectionView: UICollectionView!

    public var layout: UICollectionViewLayout {
        return UICollectionViewLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .clear
        collectionView.register(cellType: C.self)
        edgesForExtendedLayout = []
        collectionView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            if self.collectionView.mj_header.isRefreshing() {
                self.collectionView.mj_header.endRefreshing()
                return
            } else {
                self.refresh()
            }
        })
        let mjFooter = MJRefreshAutoStateFooter.init(refreshingBlock: {
            if self.collectionView.mj_header.isRefreshing() {
                self.collectionView.mj_footer.endRefreshing()
                return
            } else {
                self.loadMore()
            }
        })
        collectionView.mj_footer = mjFooter
        collectionView.mj_footer.isHidden = false
        view.addSubview(collectionView)
        collectionView.mj_header.executeRefreshingCallback()
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsIn(section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: C.self)
        self.cell(cell, indexPath: indexPath)
        return cell
    }

    func collectionView(_: UICollectionView, didSelectItemAt _: IndexPath) {
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.frame = view.bounds
    }

    func cell(_: C, indexPath _: IndexPath) {}

    func numberOfItemsIn(_: Int) -> Int {
        return 1
    }

    func refresh() {}

    /// 加载更多
    func loadMore() {}
}
