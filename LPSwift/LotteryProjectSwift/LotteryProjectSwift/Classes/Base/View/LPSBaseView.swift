//
//  LPSBaseView.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2018/1/2.
//  Copyright © 2018年 Lottery. All rights reserved.
//

import UIKit

class LPSBaseView: UIView {
    var bgView:UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubviews()
        self.setupSubviewsLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubviews() {
        self.bgView = ({ () -> UIView in
            let view =  UIView.init()
            self.addSubview(view)
            return view
            }())
    }
    func setupSubviewsLayout() {
        self.bgView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
}
