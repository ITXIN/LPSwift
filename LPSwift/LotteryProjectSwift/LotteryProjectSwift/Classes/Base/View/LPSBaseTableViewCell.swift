//
//  LPSBaseTableViewCell.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2018/1/4.
//  Copyright © 2018年 Lottery. All rights reserved.
//

import UIKit

class LPSBaseTableViewCell: UITableViewCell {
    var bgView:UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initSubviews()
        self.setupSubviewsLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initSubviews() {
        self.bgView = ({ () -> UIView in
            let view =  UIView.init()
            self.contentView.addSubview(view)
            return view
            }())
    }
    func setupSubviewsLayout() {
        self.bgView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
        }
    }
}
