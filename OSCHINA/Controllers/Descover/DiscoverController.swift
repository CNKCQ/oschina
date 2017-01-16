//
//  Created by KingCQ on 16/8/12.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import Kingfisher
import UIKit

class DiscoverController: CollectionList<GirlsCell>, CHTCollectionViewDelegateWaterfallLayout {
    
    let articleViewModel = ArticlesViewModel()
    
    override var layout: UICollectionViewLayout {
        let layout = CHTCollectionViewWaterfallLayout()
        layout.minimumColumnSpacing = whiteSpace
        layout.minimumInteritemSpacing = whiteSpace
        layout.sectionInset = UIEdgeInsets(top: whiteSpace, left: whiteSpace, bottom: whiteSpace, right: whiteSpace)
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.white
    }
    
    override func cell(_ cell: GirlsCell, indexPath: IndexPath) {
        cell.contentView.backgroundColor = .randomColor()
        cell.setData(item: articleViewModel.articleEntities[indexPath.item])
    }
    
    override func numberOfItemsIn(_ section: Int) -> Int {
        return self.articleViewModel.articleEntities.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dest = WebController()
        dest.urlStr = articleViewModel.articleEntities[indexPath.item].url
        navigationController?.pushViewController(dest, animated: true)
    }
    
    override func refresh() {
        self.articleViewModel.refresh().subscribe(
            onNext: { entities in
                print(entities)
                self.collectionView.mj_footer.resetNoMoreData()
                self.collectionView.reloadData()
        }, onError: { error in
            print(error)
            self.collectionView.mj_header.endRefreshing()
        }, onCompleted: {
            self.collectionView.mj_header.endRefreshing()
        }, onDisposed: {
        }).addDisposableTo(self.disposeBag)
    }
    
    override func loadMore() {
        self.articleViewModel.loadMore().subscribe(onNext: { (entities) in
            if entities.isEmpty {
                self.collectionView.mj_footer.endRefreshingWithNoMoreData()
            } else {
                self.collectionView.mj_footer.endRefreshing()
            }
            self.collectionView.reloadData()
        }, onError: { error in
            print(error)
            self.collectionView.mj_footer.endRefreshing()
        }, onCompleted: {
        }, onDisposed: {
        }).addDisposableTo(self.disposeBag)
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

