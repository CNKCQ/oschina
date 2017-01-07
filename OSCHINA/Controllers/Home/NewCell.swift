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
        backgroundColor = .groupTableViewBackground
        paddingView = UIView()
        paddingView.backgroundColor = UIColor.groupTableViewBackground
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: UIFont.labelFontSize)
        contentLabel = UILabel()
        contentLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        contentLabel.textColor = UIColor.gray
        contentLabel.numberOfLines = 0
        bottomView = UIView()
        bottomView.backgroundColor = UIColor.blue
        contentView.addSubview(paddingView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(bottomView)
        contentView.backgroundColor = UIColor.white

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        contentView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(10)
            make.right.equalTo(self.snp.right).offset(-10)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
        }
        paddingView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.top.equalTo(contentView.snp.top)
            make.height.equalTo(10)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(paddingView.snp.bottom)
            make.width.equalTo(contentView.snp.width).offset(-10)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.height.equalTo(24)
        }
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(titleLabel.snp.left)
            make.width.equalTo(titleLabel.snp.width)
        }
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom)
            make.left.equalTo(contentLabel.snp.left)
            make.width.equalTo(contentLabel.snp.width)
            make.height.equalTo(1)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        super.updateConstraints()
    }
}
