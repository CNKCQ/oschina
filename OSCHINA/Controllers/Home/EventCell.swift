//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/14.
//

import UIKit


class EventCell: UITableViewCell, Reusable {
    var iconView: UIImageView!
    var titleLabel: UILabel!
    var contentLabel: UILabel!
    let totalHeight: CGFloat = 60


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        iconView = UIImageView()
        titleLabel = UILabel()
        contentLabel = UILabel()
        contentView.addSubview(iconView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        iconView.frame = CGRect(x: 10, y: 5, width: 40, height: 50)
        titleLabel.frame = CGRect(x: iconView.right + 5, y: 0, width: SCREEN_WIDTH - iconView.left - 5, height: 30)
        contentLabel.frame = CGRect(x: titleLabel.x, y: titleLabel.bottom, width: titleLabel.width, height: titleLabel.height)
    }
}
