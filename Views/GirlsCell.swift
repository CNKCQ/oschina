//
//  GirlsCell.swift
//  OSCHINA
//
//  Created by KingCQ on 2017/1/15.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit
import Kingfisher

class GirlsCell: CollectionCell {
    var imageView: UIImageView!
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        label = UILabel(frame: CGRect(x: 0, y: frame.size.width, width: frame.size.width, height: frame.size.height - frame.size.width))
        label.backgroundColor = .black
        label.alpha = 0.7
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = .white
        addSubview(imageView)
        addSubview(label)
    }
    
    func setData<T: ArticleEntity>(item: T) {
        imageView.kf.setImage(with: URL(string: item.url!)!)
        label.text = item.desc
        label.height = item.desc!.heightWithConstrainedWidth(width: frame.size.width, font: UIFont.systemFont(ofSize: 15))
        imageView.height = frame.size.width  + label.height
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
