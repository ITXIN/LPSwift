//
//  LPSLoginBaseViewController.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2018/1/2.
//  Copyright © 2018年 Lottery. All rights reserved.
//

import UIKit
import ReactiveCocoa
typealias LPSLoginBaseViewControllerCallBack = ()->Void
typealias LPSSignInBaseViewControllerCallBack = ()->Void
class LPSLoginBaseViewController: LPSBaseViewController {
    var phoneNumberInputView: LPSInputView!
    var nextBtn:UIButton!
    var loginBaseVCCallBack:LPSLoginBaseViewControllerCallBack?
    var signInBaseVCCallBack:LPSSignInBaseViewControllerCallBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func initSubviews() {
        super.initSubviews()
        self.phoneNumberInputView = LPSInputView();
        self.bgView.addSubview(self.phoneNumberInputView)
        self.phoneNumberInputView.inputTextField.placeholder = "手机号码"
        self.phoneNumberInputView.leftIconImageView.image = UIImage.init(named: "icon_mob")
        self.phoneNumberInputView.inputTextField.keyboardType = UIKeyboardType.numberPad

        self.nextBtn = ({ () -> UIButton in
            let btn =  UIButton.init()
            self.bgView.addSubview(btn)
            btn.setBackgroundImage(LPSProjectHelper.getImage(color: UIColor.lpsThemColor(), rect: CGRect.init(x: 0, y: 0, width: 1, height: 1)), for: UIControlState.normal)
            
            btn.addTarget(self, action:#selector(self.nextBtnAction) , for: UIControlEvents.touchUpInside)
            btn.layer.cornerRadius = 5;
            btn.layer.masksToBounds = true
            return btn
            }())
        
    }
    
    @objc func nextBtnAction() {

    }
    
    override func setupSubviewsLayout() {
        super.setupSubviewsLayout()
        self.phoneNumberInputView.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.leading.trailing.equalTo(self.bgView)
            make.height.equalTo(62)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
