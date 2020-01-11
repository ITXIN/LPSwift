//
//  LPSLoginRootController.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2017/12/29.
//  Copyright © 2017年 Lottery. All rights reserved.
//

import UIKit
enum LoginActionType:Int {
    case LoginActionTypeLogin = 1000,
    LoginActionTypeSignIn
}

class LPSLoginRootController: LPSBaseViewController {
    
    var scrollView  = UIScrollView()
    var bottomView = UIView()
    var logInBtn = UIButton()
    var signInBtn = UIButton()
    var imagesArr = NSMutableArray()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func initSubviews() {
        super.initSubviews()
        self.bgView.backgroundColor = UIColor.white
        self.scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
        self.bgView.addSubview(self.scrollView)
        self.scrollView.isPagingEnabled = true
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.contentSize = CGSize.init(width: 4*kScreenWidth, height: 0)
        self.imagesArr = NSMutableArray.init()
        for i  in 0...4 {
            let   bgImageView = ({ () -> UIImageView in
                let img =  UIImageView.init()
                self.scrollView.addSubview(img)
                let strName = "Lanch" + String.init(format: "%ld", i+1)
                img.image = UIImage.init(named: strName)
                return img
                }())
            
            self.imagesArr.add(bgImageView)
        }
        self.bottomView = ({ () -> UIView in
            let view =  UIView.init()
            self.bgView.addSubview(view)
            return view
            }())
        let color = RGB(51, G: 49, B: 54)
        self.logInBtn = ({ () -> UIButton in
            let btn =  UIButton.init()
            self.bottomView.addSubview(btn)
            btn.addTarget(self, action:#selector(btnAction(_:)) , for: UIControlEvents.touchUpInside)
            btn.tag = LoginActionType.LoginActionTypeLogin.rawValue
            //不带参数
            //            btn.addTarget(self, action:#selector(self.btnAction) , for: UIControlEvents.touchUpInside)
            btn.backgroundColor = UIColor.white
            btn.setTitle("登录", for: UIControlState.normal)
            btn.setTitleColor(color, for: UIControlState.normal)
            btn.layer.cornerRadius = 15
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            btn.layer.borderColor = color.cgColor
            btn.layer.borderWidth = 1
            btn.layer.masksToBounds = true
            return btn
            }())
        
        self.signInBtn = ({ () -> UIButton in
            let btn =  UIButton.init()
            self.bottomView.addSubview(btn)
            btn.addTarget(self, action:#selector(btnAction(_:)) , for: UIControlEvents.touchUpInside)
            btn.tag = LoginActionType.LoginActionTypeSignIn.rawValue
            //不带参数
            btn.backgroundColor = color
            btn.setTitle("注册", for: UIControlState.normal)
            btn.setTitleColor(UIColor.white, for: UIControlState.normal)
            btn.layer.cornerRadius = 15
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            btn.layer.borderColor = color.cgColor
            btn.layer.borderWidth = 1
            btn.layer.masksToBounds = true
            return btn
            }())
        
    }
    //不带参数
    //    @objc func btnAction() {
    //
    //    }
    @objc func btnAction(_ sender:UIButton) {
        let tag  = sender.tag
        
        switch tag {
        case LoginActionType.LoginActionTypeSignIn.rawValue:
            LPLog("sigin")
            break
        case LoginActionType.LoginActionTypeLogin.rawValue:
            LPLog("login")
            let loginVC = LPSLoginWithPasswordController()
            loginVC.loginBaseVCCallBack = {
               LPLog("登录")
                let main = LPSMainViewController()
                self.restoreRootViewController(rootViewController: main)
            }
           
            self.navigationController?.pushViewController(loginVC, animated: true)
            break
        default: break
            
        }
    }
    override func setupSubviewsLayout() {
        super.setupSubviewsLayout()
        
        self.scrollView.snp.makeConstraints { (make) in
            make.width.equalTo(kScreenWidth)
            make.left.equalTo(0)
            
            if(kiPhoneX){
                make.top.equalTo(kStatusBarHeight)
            }else{
                make.top.equalTo(0)
            }
            
            make.bottom.equalTo(self.bottomView.snp.top)
        }
        
        for i  in 0...self.imagesArr.count-1 {
            let imageView = self.imagesArr[i] as! UIImageView
            let left = CGFloat(i)*kScreenWidth
            imageView.snp.makeConstraints { (make) in
                make.left.equalTo(left)
                make.top.equalTo(0)
                make.size.equalTo(self.scrollView)
            }
        }
        
        self.bottomView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(self.bgView)
            make.height.equalTo(130)
            make.bottom.equalTo(0)
        }
        
        self.logInBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.bottomView)
            make.right.equalTo(self.bottomView.snp.centerX).offset(-10)
            make.size.equalTo(CGSize.init(width: 120, height: 30))
        }
        self.signInBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.logInBtn)
            make.left.equalTo(self.bottomView.snp.centerX).offset(10)
            make.size.equalTo(self.logInBtn)
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
