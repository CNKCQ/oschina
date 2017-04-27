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

    override func numberOfItemsIn(_: Int) -> Int {
        return articleViewModel.articleEntities.count
    }

    override func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dest = WebController()
        dest.urlStr = articleViewModel.articleEntities[indexPath.item].url
        navigationController?.pushViewController(dest, animated: true)
    }

    override func refresh() {
        articleViewModel.refresh().subscribe(
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
        }).addDisposableTo(disposeBag)
    }

    override func loadMore() {
        articleViewModel.loadMore().subscribe(onNext: { entities in
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
        }).addDisposableTo(disposeBag)
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout,
                        sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let desc = articleViewModel.articleEntities[indexPath.item].desc!
        let width = (collectionView.bounds.width - whiteSpace * 3) / 2
        
        let height = desc.height(withConstrainedWidth: width, font: UIFont.systemFont(ofSize: 15))
        return CGSize(width: width, height: width + height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        print("died ---- \(self)")
    }
}

extension String {

    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }

}
