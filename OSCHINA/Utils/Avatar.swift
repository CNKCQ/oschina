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
        let width = self.frame.size.width
        let height = self.frame.size.height
        
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setLineWidth(borderWidth)
        context?.setStrokeColor(borderColor.cgColor)
        context?.setFillColor(backgroundColor.cgColor)
        
        context?.move(to: CGPoint(x: width - borderWidth / 2, y: radius + borderWidth / 2))  // 开始坐标
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
        
        context?.drawPath(using: .fillStroke)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        let imageView: UIImageView = UIImageView(image: image)
        self.insertSubview(imageView, at: 0)
    }
}

