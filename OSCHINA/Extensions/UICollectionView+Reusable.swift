/*********************************************
 *
 * This code is under the MIT License (MIT)
 *
 * Copyright (c) 2016 AliSoftware
 *
 *********************************************/

import UIKit

public extension UICollectionView {
    final func registerReusableCell<T: UICollectionViewCell where T: NibReusable>(cellType: T.Type) {
        self.registerNib(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func registerReusableCell<T: UICollectionViewCell where T: Reusable>(cellType: T.Type) {
        self.registerClass(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func dequeueReusableCell<T: UICollectionViewCell where T: Reusable>(indexPath indexPath: NSIndexPath, cellType: T.Type = T.self) -> T {
        guard let cell = self.dequeueReusableCellWithReuseIdentifier(cellType.reuseIdentifier, forIndexPath: indexPath) as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the cell beforehand"
            )
        }
        return cell
    }
    
    final func registerReusableSupplementaryView<T: UICollectionReusableView where T: NibReusable>(elementKind: String, viewType: T.Type) {
        self.registerNib(viewType.nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: viewType.reuseIdentifier)
    }
    
    final func registerReusableSupplementaryView<T: UICollectionReusableView where T: Reusable>(elementKind: String, viewType: T.Type) {
        self.registerClass(viewType.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: viewType.reuseIdentifier)
    }
    
    final func dequeueReusableSupplementaryView<T: UICollectionReusableView where T: Reusable>
        (elementKind: String, indexPath: NSIndexPath, viewType: T.Type = T.self) -> T {
        let view = self.dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: viewType.reuseIdentifier, forIndexPath: indexPath)
        guard let typedView = view as? T else {
            fatalError(
                "Failed to dequeue a supplementary view with identifier \(viewType.reuseIdentifier) matching type \(viewType.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the supplementary view beforehand"
            )
        }
        return typedView
    }
}
