//
//  Copyright © 2016年 Jack. All rights reserved.
//

import UIKit

// see: https://objccn.io/issue-3-1/ 离屏渲染
extension UIImage {
    func cs_imageWithCornerRadius(radius: CGFloat, sizeToFit: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: sizeToFit)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.mainScreen().scale)
        let path: CGPathRef = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: CGSize(width: radius, height: radius)).CGPath
        CGContextAddPath(UIGraphicsGetCurrentContext(), path)
        CGContextClip(UIGraphicsGetCurrentContext())
        
        self.drawInRect(rect)
        CGContextDrawPath(UIGraphicsGetCurrentContext(), .FillStroke)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIImageView {
    func cs_cornerRadiusImageView(radius: CGFloat) {
        self.image = self.image?.cs_imageWithCornerRadius(radius, sizeToFit: self.bounds.size)
    }
}

extension UIView {
    func cs_cornerRadius(radius: CGFloat,
                         borderWidth: CGFloat,
                         borderColor: UIColor,
                         backgroundColor: UIColor) {
        let width = self.frame.size.width
        let height = self.frame.size.height
        
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, UIScreen.mainScreen().scale)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, borderWidth)
        CGContextSetStrokeColorWithColor(context, borderColor.CGColor)
        CGContextSetFillColorWithColor(context, backgroundColor.CGColor)
        
        CGContextMoveToPoint(context,
                             width - borderWidth / 2,
                             radius + borderWidth / 2)  // 开始坐标
        CGContextAddArcToPoint(context,
                               width - borderWidth / 2,
                               height - borderWidth / 2,
                               width - radius - borderWidth / 2,
                               height - borderWidth / 2,
                               radius)  // 右下角
        CGContextAddArcToPoint(context,
                               borderWidth / 2,
                               height - borderWidth / 2,
                               borderWidth / 2,
                               height - radius - borderWidth / 2,
                               radius) // 左下角
        CGContextAddArcToPoint(context,
                               borderWidth / 2,
                               borderWidth / 2,
                               width - borderWidth / 2,
                               borderWidth / 2,
                               radius) // 左上角
        CGContextAddArcToPoint(context,
                               width - borderWidth / 2,
                               borderWidth / 2,
                               width - borderWidth / 2,
                               radius + borderWidth / 2,
                               radius) // 右上角
        
        CGContextDrawPath(context, .FillStroke)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let imageView: UIImageView = UIImageView(image: image)
        self.insertSubview(imageView, atIndex: 0)
    }
}

