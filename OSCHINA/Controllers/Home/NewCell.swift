//
//  NewCell.swift
//  OSCHINA
//
//  Created by KingCQ on 16/9/1.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

import UIKit
import SnapKit

class NewCell: UITableViewCell, Reusable {

    var titleLabel: UILabel!
    var contentLabel: UILabel!
    var bottomView: UIView!
    var paddingView: UIView!


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .groupTableViewBackgroundColor()
        paddingView = UIView()
        paddingView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFontOfSize(UIFont.labelFontSize())
        contentLabel = UILabel()
        contentLabel.font = UIFont.systemFontOfSize(UIFont.systemFontSize())
        contentLabel.textColor = UIColor.grayColor()
        contentLabel.numberOfLines = 0
        bottomView = UIView()
//        bottomView.backgroundColor = UIColor.blueColor()
        contentView.addSubview(paddingView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(bottomView)
        contentView.backgroundColor = UIColor.whiteColor()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        contentView.snp_makeConstraints { (make) in
            make.left.equalTo(self.snp_left).offset(10)
            make.right.equalTo(self.snp_right).offset(-10)
            make.top.equalTo(self.snp_top)
            make.bottom.equalTo(self.snp_bottom)
        }
        paddingView.snp_makeConstraints { (make) in
            make.left.equalTo(contentView.snp_left)
            make.right.equalTo(contentView.snp_right)
            make.top.equalTo(contentView.snp_top)
            make.height.equalTo(10)
        }
        titleLabel.snp_makeConstraints { (make) in
            make.top.equalTo(paddingView.snp_bottom)
            make.width.equalTo(contentView.snp_width).offset(-10)
            make.left.equalTo(contentView.snp_left).offset(10)
            make.height.equalTo(24)
        }
        contentLabel.snp_makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp_bottom)
            make.left.equalTo(titleLabel.snp_left)
            make.width.equalTo(titleLabel.snp_width)
        }
        bottomView.snp_makeConstraints { (make) in
            make.top.equalTo(contentLabel.snp_bottom)
            make.left.equalTo(contentLabel.snp_left)
            make.width.equalTo(contentLabel.snp_width)
            make.height.equalTo(1)
            make.bottom.equalTo(contentView.snp_bottom)
        }
        super.updateConstraints()
    }
}
