//
//  LPSPCHeaderView.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2018/1/4.
//  Copyright © 2018年 Lottery. All rights reserved.
//

import UIKit

class LPSPCHeaderView: LPSBaseView {
    var bgImageView:UIImageView!
    var iconView:UIImageView!
    var nameLab: UILabel!
    var authStatusBtn: UIButton!
    var amountView: LPSDoubleRowView!
    var gmosaicGoldView: LPSDoubleRowView!

    override func initSubviews() {
        super.initSubviews()
        
        self.bgImageView = ({ () -> UIImageView in
            let img =  UIImageView.init()
            self.bgView.addSubview(img)
            img.image = UIImage.init(named: "bg_banner")
            return img
            }())
        self.iconView = ({ () -> UIImageView in
            let img =  UIImageView.init()
            self.bgView.addSubview(img)
            img.image = UIImage.init(named: "head_me")
            return img
            }())
        
        self.nameLab = ({ () -> UILabel in
            let lab =  UILabel.init()
            self.bgView.addSubview(lab)
            lab.textColor = UIColor.white
            lab.font = UIFont.systemFont(ofSize: 15)
            lab.text = "dkslfl"
            return lab
            }())
        self.authStatusBtn = ({ () -> UIButton in
            let btn =  UIButton.init(type: UIButtonType.custom)
            self.bgView.addSubview(btn)
            btn.setImage(UIImage.init(named: "btn_renzheng"), for: UIControlState.normal)
            return btn
            }())
        
        self.amountView = ({ () -> LPSDoubleRowView in
            let view =  LPSDoubleRowView.init()
            self.bgView.addSubview(view)
            view.firstLab.text = "总额(元)"
            view.secondLab.text = "1000.00"
            view.lineView.backgroundColor = UIColor.white
            view.firstLab.textColor = UIColor.white
            view.secondLab.textColor = UIColor.white
            return view
            }())
        self.gmosaicGoldView = ({ () -> LPSDoubleRowView in
            let view =  LPSDoubleRowView.init()
            self.bgView.addSubview(view)
            view.firstLab.text = "彩金(元)"
            view.secondLab.text = "1000.00"
            view.firstLab.textColor = UIColor.white
            view.secondLab.textColor = UIColor.white
            view.lineView.isHidden = true
            return view
            }())
        
    }
    
    override func setupSubviewsLayout() {
        super.setupSubviewsLayout()
        self.bgImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.bgView)
        }
        self.iconView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.bgView)
            make.top.equalTo(10)
        }
        self.nameLab.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.bgView)
            make.top.equalTo(self.iconView.snp.bottom).offset(10)
        }
        self.authStatusBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.bgView)
            make.top.equalTo(self.nameLab.snp.bottom).offset(5)
        }
        self.amountView.snp.makeConstraints { (make) in
            make.top.equalTo(self.authStatusBtn.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.height.equalTo(60)
            make.width.equalTo(kScreenWidth/2)
        }
        self.gmosaicGoldView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.amountView)
            make.right.equalTo(0)
            make.height.equalTo(self.amountView)
            make.width.equalTo(self.amountView)
        }
    }

}
