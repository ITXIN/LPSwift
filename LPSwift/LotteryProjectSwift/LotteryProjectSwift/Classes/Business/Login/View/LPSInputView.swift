//
//  LPSInputView.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2018/1/2.
//  Copyright © 2018年 Lottery. All rights reserved.
//

import UIKit

class LPSInputView: LPSBaseView {

    var leftIconImageView :UIImageView!
    var inputTextField :UITextField!
    var lineView :UIView!
    
    override func initSubviews() {
        super.initSubviews()
        self.leftIconImageView = ({ () -> UIImageView in
            let img =  UIImageView.init()
            self.bgView.addSubview(img)
            return img
            }())
        
        
        self.inputTextField = ({ () -> UITextField in
            let tf =  UITextField.init()
            self.bgView.addSubview(tf)
            tf.placeholder = ""
            tf.font = UIFont.systemFont(ofSize: 15)
            tf.clearButtonMode = UITextFieldViewMode.whileEditing
            return tf
            }())
        
        self.lineView = ({ () -> UIView in
            let view =  UIView.init()
            self.bgView.addSubview(view)
            view.backgroundColor = RGB(222, G: 222, B: 222)
            return view
            }())
        
    }
    override func setupSubviewsLayout() {
        super.setupSubviewsLayout()
        self.inputTextField.snp.makeConstraints { (make) in
            make.right.equalTo(-25)
            make.left.equalTo(self.leftIconImageView.snp.right).offset(5)
            make.centerY.equalTo(self.leftIconImageView)
            make.height.equalTo(30)
        }
        self.leftIconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.centerY.equalTo(self.bgView)
            make.right.equalTo(self.inputTextField.snp.left).offset(-5)
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.left.equalTo(self.leftIconImageView)
            make.right.equalTo(-25)
            make.bottom.equalTo(0)
            make.height.equalTo(1)
        }
    }
    
}
