/*********************************************
 *
 * This code is under the MIT License (MIT)
 *
 * Copyright (c) 2016 AliSoftware
 *
 *********************************************/

import UIKit

public extension UITableView {
    final func registerReusableCell<T: UITableViewCell where T: NibReusable>(cellType: T.Type) {
        self.registerNib(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func registerReusableCell<T: UITableViewCell where T: Reusable>(cellType: T.Type) {
        self.registerClass(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func dequeueReusableCell<T: UITableViewCell where T: Reusable>(indexPath indexPath: NSIndexPath, cellType: T.Type = T.self) -> T {
        guard let cell = self.dequeueReusableCellWithIdentifier(cellType.reuseIdentifier, forIndexPath: indexPath) as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the cell beforehand"
            )
        }
        return cell
    }
    
    final func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView where T: NibReusable>(viewType: T.Type) {
        self.registerNib(viewType.nib, forHeaderFooterViewReuseIdentifier: viewType.reuseIdentifier)
    }
    
    final func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView where T: Reusable>(viewType: T.Type) {
        self.registerClass(viewType.self, forHeaderFooterViewReuseIdentifier: viewType.reuseIdentifier)
    }
    
    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView where T: Reusable>(viewType: T.Type = T.self) -> T? {
        guard let view = self.dequeueReusableHeaderFooterViewWithIdentifier(viewType.reuseIdentifier) as? T? else {
            fatalError(
                "Failed to dequeue a header/footer with identifier \(viewType.reuseIdentifier) matching type \(viewType.self). "
                    + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                    + "and that you registered the header/footer beforehand"
            )
        }
        return view
    }
}
