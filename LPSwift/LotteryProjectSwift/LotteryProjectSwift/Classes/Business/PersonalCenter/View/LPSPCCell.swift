//
//  LPSPCCell.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2018/1/4.
//  Copyright © 2018年 Lottery. All rights reserved.
//

import UIKit

class LPSPCCell: LPSBaseTableViewCell {

    var bottomLineView:UIView!
    var leftImageView:UIImageView!
    var leftTitleLab:UILabel!
    var rightTitleLab:UILabel!
    var rightImageView:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func initSubviews() {
        super.initSubviews()
        self.bottomLineView = ({ () -> UIView in
            let view =  UIView.init()
            self.bgView.addSubview(view)
            view.backgroundColor = UIColor.lpsGrayBgColor()
            return view
            }())
        
        self.leftTitleLab = ({ () -> UILabel in
            let lab =  UILabel.init()
            self.bgView.addSubview(lab)
            lab.textColor = UIColor.lpsBlackTextColor()
            lab.font = UIFont.systemFont(ofSize: 14)
            return lab
            }())
        self.rightTitleLab = ({ () -> UILabel in
            let lab =  UILabel.init()
            self.bgView.addSubview(lab)
            lab.textColor = UIColor.lpsBlackTextColor()
            lab.font = UIFont.systemFont(ofSize: 14)
            lab.textAlignment = NSTextAlignment.right
            return lab
            }())
        
        self.leftImageView = ({ () -> UIImageView in
            let img =  UIImageView.init()
            self.bgView.addSubview(img)
            return img
            }())
        self.rightImageView = ({ () -> UIImageView in
            let img =  UIImageView.init()
            self.bgView.addSubview(img)
            img.image = UIImage.init(named: "person_icon_jump")
            return img
            }())
        
    }
    override func setupSubviewsLayout() {
        super.setupSubviewsLayout()
        self.leftImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bgView)
            make.left.equalTo(20)
        }
        self.leftTitleLab.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bgView)
            make.left.equalTo(self.leftImageView.snp.right).offset(10)
        }
        self.rightImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bgView)
            make.right.equalTo(-20)
        }
        self.rightTitleLab.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bgView)
            make.right.equalTo(self.rightImageView.snp.left).offset(-10)
        }
        self.bottomLineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.height.equalTo(1)
            make.trailing.leading.equalTo(self.bgView)
        }
    }

}
