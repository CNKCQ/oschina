//
//  Created by KingCQ on 16/8/12.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import Kingfisher
import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import MJRefresh


class DiscoverController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout {
    let whiteSpace = CGFloat(0.8)
    var collectionView: UICollectionView!
    let articleViewModel = ArticlesViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(frame: CGRect(x: 10, y: 100, width: view.frame.size.width - 20, height: 480))
        imageView.kf.setImage(with: URL(string: "http://ww1.sinaimg.cn/mw690/692a6bbcgw1f4fz7s830fj20gg0o00y5.jpg")!)
        view.addSubview(imageView)
        let layout = CHTCollectionViewWaterfallLayout()
        
        layout.minimumColumnSpacing = whiteSpace
        layout.minimumInteritemSpacing = whiteSpace
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsetsMake(whiteSpace, whiteSpace, whiteSpace, whiteSpace)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.register(GirlsCell.self, forCellWithReuseIdentifier: NSStringFromClass(GirlsCell.self))
        edgesForExtendedLayout = []
        collectionView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: { 
            if self.collectionView.mj_header.isRefreshing() {
                self.collectionView.mj_header.endRefreshing()
                return
            } else {
                self.articleViewModel.refresh().subscribe(
                    onNext: { (entities) in
                        print(entities)
                        self.collectionView.mj_footer.resetNoMoreData()
                        self.collectionView.reloadData()
                }, onError: { (error) in
                    print(error)
                    self.collectionView.mj_header.endRefreshing()
                }, onCompleted: {
                    self.collectionView.mj_header.endRefreshing()
                }, onDisposed: {
                    
                }).addDisposableTo(self.disposeBag)
            }
        })
        let mjFooter = MJRefreshAutoStateFooter.init(refreshingBlock: {
            if self.collectionView.mj_header.isRefreshing() {
                self.collectionView.mj_footer.endRefreshing()
                return
            } else {
                self.articleViewModel.loadMore().subscribe(onNext: { (entities) in
                    if entities.isEmpty {
                        self.collectionView.mj_footer.endRefreshingWithNoMoreData()
                    } else {
                        self.collectionView.mj_footer.endRefreshing()
                    }
                    self.collectionView.reloadData()
                    
                }, onError: { (error) in
                    print(error)
                    self.collectionView.mj_footer.endRefreshing()
                }, onCompleted: {
                    
                    
                }, onDisposed: {
                    
                    
                }).addDisposableTo(self.disposeBag)
            }
        })
        collectionView.mj_footer = mjFooter
        collectionView.mj_footer.isHidden = false
        
        view.addSubview(collectionView)
        collectionView.mj_header.executeRefreshingCallback()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articleViewModel.articleEntities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(GirlsCell.self), for: indexPath) as! GirlsCell
        cell.contentView.backgroundColor = .randomColor()
        cell.setData(item: articleViewModel.articleEntities[indexPath.item])
        return cell
    }
    
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                         sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let desc = articleViewModel.articleEntities[indexPath.item].desc!
        let width = (collectionView.bounds.width - whiteSpace * 3) / 2
        let height = desc.heightWithConstrainedWidth(width: width, font: UIFont.systemFont(ofSize: 15))
        return CGSize(width: width, height: width + height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
        print("died ---- \(self)")
    }
    
}

extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }
}

