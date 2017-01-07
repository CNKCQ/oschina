//
//  Copyright © 2016年 Jack. All rights reserved.
//

import UIKit

// see: https://objccn.io/issue-3-1/ 离屏渲染
extension UIImage {
    func cs_imageWithCornerRadius(_ radius: CGFloat, sizeToFit: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: sizeToFit)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        let path: CGPath = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        UIGraphicsGetCurrentContext()?.addPath(path)
        UIGraphicsGetCurrentContext()?.clip()
        
        self.draw(in: rect)
        UIGraphicsGetCurrentContext()?.drawPath(using: .fillStroke)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIImageView {
    func cs_cornerRadiusImageView(_ radius: CGFloat) {
        self.image = self.image?.cs_imageWithCornerRadius(radius, sizeToFit: self.bounds.size)
    }
}

extension UIView {
    func cs_cornerRadius(_ radius: CGFloat,
                         borderWidth: CGFloat,
                         borderColor: UIColor,
                         backgroundColor: UIColor) {
        _ = self.frame.size.width
        _ = self.frame.size.height
        
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setLineWidth(borderWidth)
        context?.setStrokeColor(borderColor.cgColor)
        context?.setFillColor(backgroundColor.cgColor)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let imageView: UIImageView = UIImageView(image: image)
        self.insertSubview(imageView, at: 0)
    }
}

