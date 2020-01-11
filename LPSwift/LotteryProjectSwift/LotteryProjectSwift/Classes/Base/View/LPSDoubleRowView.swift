//
//  LPSDoubleRowView.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2018/1/4.
//  Copyright © 2018年 Lottery. All rights reserved.
//

import UIKit

class LPSDoubleRowView: LPSBaseView {

    var firstLab: UILabel!
    var secondLab: UILabel!
    var lineView: UIView!
    override func initSubviews() {
        super.initSubviews()
        self.firstLab = ({ () -> UILabel in
            let lab =  UILabel.init()
            self.bgView.addSubview(lab)
            lab.textAlignment = NSTextAlignment.center
            lab.textColor = UIColor.lpsBlackTextColor()
            lab.font = UIFont.systemFont(ofSize: 14)
            return lab
            }())
        self.secondLab = ({ () -> UILabel in
            let lab =  UILabel.init()
            self.bgView.addSubview(lab)
            lab.textAlignment = NSTextAlignment.center
            lab.textColor = UIColor.lpsBlackTextColor()
            lab.font = UIFont.systemFont(ofSize: 20)
            return lab
            }())
        self.lineView = ({ () -> UIView in
            let view =  UIView.init()
            self.bgView.addSubview(view)
            view.backgroundColor = UIColor.lpsGrayLineColor()
            return view
            }())
        
    }
    
    override func setupSubviewsLayout() {
        super.setupSubviewsLayout()
        self.firstLab.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.bgView)
            make.bottom.equalTo(self.bgView.snp.centerY)
            make.leading.trailing.equalTo(self.bgView)
        }
        self.secondLab.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.firstLab)
            make.top.equalTo(self.firstLab.snp.bottom).offset(5)
            make.leading.trailing.equalTo(self.bgView)
        }
        self.lineView.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(1)
            make.right.equalTo(-1)
            make.centerY.equalTo(self.bgView)
        }
        
    }

}
