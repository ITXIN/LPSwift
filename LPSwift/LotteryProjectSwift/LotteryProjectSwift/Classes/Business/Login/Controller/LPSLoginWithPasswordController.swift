//
//  LPSLoginWithPasswordController.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2018/1/2.
//  Copyright © 2018年 Lottery. All rights reserved.
//

import UIKit

class LPSLoginWithPasswordController: LPSLoginBaseViewController {
    var passwordInputView: LPSInputView!
    var forgetPWBtn:UIButton!
    var keepPWBtn:UIButton!
    var loginWithSMSCodeBtn:UIButton!
    var isValidPassword:Bool!
    var validPhoneNumber:Bool!
    enum LoginActionType:Int {
        case LoginActionTypeLogin = 1000,
        LoginActionTypeKeepPW,
        LoginActionTypeLoginWithSMSCode,
        LoginActionTypeForgetPW
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func initSubviews() {
        super.initSubviews()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action:#selector(self.signInAction))
        
        self.title = "登录"
        self.passwordInputView = LPSInputView();
        self.bgView.addSubview(self.passwordInputView)
        self.passwordInputView.inputTextField.placeholder = "密码"
        self.passwordInputView.inputTextField.isSecureTextEntry = true
        self.passwordInputView.leftIconImageView.image = UIImage.init(named: "icon_password")
        self.passwordInputView.inputTextField.keyboardType = UIKeyboardType.default
        self.nextBtn.setTitle(self.title, for: UIControlState.normal)
        self.setupSignal()
        
        self.keepPWBtn = ({ () -> UIButton in
            let btn = UIButton.init(type: UIButtonType.custom)
            self.bgView.addSubview(btn)
            btn.setImage(UIImage.init(named: "icon_unchecked"), for: UIControlState.normal)
             btn.setImage(UIImage.init(named: "icon_checked"), for: UIControlState.selected)
            //button标题的偏移量，这个偏移量是相对于图片的
            btn.titleEdgeInsets = UIEdgeInsetsMake(0,(btn.imageView?.frame.size.width)!+10, 0, 0)
            //button图片的偏移量，距上左下右分别像素点
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -(btn.titleLabel?.frame.size.width)!+(btn.imageView?.frame.size.width)!+10)
            btn.addTarget(self, action:#selector(self.btnAction(_:)) , for: UIControlEvents.touchUpInside)
            btn.setTitle("记住密码", for: UIControlState.normal)
            btn.setTitleColor(UIColor.lpsGrayTextColor(), for: UIControlState.normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.tag = LoginActionType.LoginActionTypeKeepPW.rawValue
            return btn
            }())
        
        self.forgetPWBtn = ({ () -> UIButton in
            let btn =  UIButton.init(type: UIButtonType.system)
            
            self.bgView.addSubview(btn)
           
            btn.addTarget(self, action:#selector(self.btnAction(_:)) , for: UIControlEvents.touchUpInside)
            btn.setTitle("忘记密码?", for: UIControlState.normal)
            btn.setTitleColor(UIColor.lpsGrayTextColor(), for: UIControlState.normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.tag = LoginActionType.LoginActionTypeForgetPW.rawValue
            return btn
            }())
        self.loginWithSMSCodeBtn = ({ () -> UIButton in
            let btn =  UIButton.init(type: UIButtonType.system)
            self.bgView.addSubview(btn)
            
            btn.addTarget(self, action:#selector(self.btnAction(_:)) , for: UIControlEvents.touchUpInside)
            btn.setTitle("使用短信验证码登录", for: UIControlState.normal)
            btn.setTitleColor(UIColor.lpsGrayTextColor(), for: UIControlState.normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.tag = LoginActionType.LoginActionTypeLoginWithSMSCode.rawValue
            return btn
            }())
        
    }
    
    @objc func signInAction() {
        LPLog("signInAction")
    }
    @objc override func nextBtnAction(){
        if (self.loginBaseVCCallBack != nil) {
            self.loginBaseVCCallBack!()
        }
    }
    @objc func btnAction(_ sender:UIButton) {
        let tag = sender.tag
        switch tag {
        case LoginActionType.LoginActionTypeLoginWithSMSCode.rawValue:
            LPLog("smscode")
            break
        case LoginActionType.LoginActionTypeKeepPW.rawValue:
            LPLog("keepPW")
            sender.isSelected = !sender.isSelected;
            break
        case LoginActionType.LoginActionTypeForgetPW.rawValue:
            LPLog("forgetPW")
            break
            
        default:
           break
        }
    }
    
    func setupSignal() {
       
//        let signalStr = signal(2) { (type) in
//
//        }
        
//
//        self.phoneNumberInputView.inputTextField.reactive.continuousTextValues.observeValues { (text) in
//            LPLog(text)
//        }

//
//        let validPhoneNumberSignal = self.phoneNumberInputView.inputTextField.reactive.continuousTextValues.map({
//            text in
//
//            return self.validPhoneNumber
//        })
////
//        validPhoneNumberSignal.map({
//            isValidUsername in
//
//            return self.validPhoneNumber ? UIColor.clear : UIColor.yellow
//        }).observeValues {
//            backgroundColor in
//
////            self.usernameTextField.backgroundColor = backgroundColor
//        }

//        let validPasswordSignal = self.passwordInputView.inputTextField.reactive.continuousTextValues.map({
//            text in
//
//            return self.isValidPassword
//        })
        
//        let sign = signal.(2, { (t) in
//
//        })
        
        
        
        
        
//        let signUpActiveSignal = Signal.combineLatest(validPhoneNumberSignal, validPasswordSignal)
        
      
//
//        signUpActiveSignal.map({
//            (isValidUsername, isValidPassword) in
//
//            return isValidUsername && isValidPassword
//        }).observeValues {
//            signupActive in
//
//            self.nextBtn.isEnabled = signupActive
//        }
        
//        作者：EvilNOP
//        链接：https://www.jianshu.com/p/3a56d10e99a7
//        來源：简书
//        著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
        
        
    }
    
    override func setupSubviewsLayout() {
        super.setupSubviewsLayout()
        self.passwordInputView.snp.makeConstraints { (make) in
            make.top.equalTo(self.phoneNumberInputView.snp.bottom).offset(0)
            make.leading.trailing.equalTo(self.bgView)
            make.height.equalTo(self.phoneNumberInputView)
        }
        
        self.keepPWBtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.passwordInputView.leftIconImageView)
            make.top.equalTo(self.passwordInputView.snp.bottom).offset(25)
            make.width.equalTo(85)
        }
        self.forgetPWBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.centerY.equalTo(self.keepPWBtn)
        }
       
        self.nextBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.bgView)
            make.top.equalTo(self.keepPWBtn.snp.bottom).offset(25)
            make.size.equalTo(CGSize.init(width: 320, height: 44))
        }
        self.loginWithSMSCodeBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.bgView)
            make.top.equalTo(self.nextBtn.snp.bottom).offset(20)
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
