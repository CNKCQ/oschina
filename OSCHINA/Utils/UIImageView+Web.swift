//
//  UIImageView+Web.swift
//  Swiftk
//
//  Created by Jack on 16/4/17.
//  Copyright © 2016年 Jack. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImageWithURL(_ URL: URL?,
                            placeholderImage: Image? = nil,
                            optionsInfo: KingfisherOptionsInfo? = nil,
                            progressBlock: DownloadProgressBlock? = nil,
                            completionHandler: CompletionHandler? = nil) -> RetrieveImageTask {

        return  setImageWithURL(URL, placeholderImage: placeholderImage, optionsInfo: optionsInfo, progressBlock: progressBlock, completionHandler: completionHandler)

    }

}
