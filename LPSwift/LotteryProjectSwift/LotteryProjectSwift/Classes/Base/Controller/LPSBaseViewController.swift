//
//  LPSBaseViewController.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2017/12/29.
//  Copyright © 2017年 Lottery. All rights reserved.
//

import UIKit


class LPSBaseViewController: UIViewController {
    var bgView : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initSubviews()
        self.setupSubviewsLayout()
    }
    
    func initSubviews() {
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.backgroundColor = UIColor.white
        self.bgView = ({ () -> UIView in
            let view =  UIView.init()
            self.view.addSubview(view)
            view.backgroundColor = UIColor.lpsGrayBgColor()
            return view
            }())
        
        
    }
    func restoreRootViewController(rootViewController:UIViewController) {
        typealias Animation = ()->Void
        let window = UIApplication.shared.keyWindow
        rootViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        var navc:LPSBaseNavigaionController!
        
        let animation = {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            if (rootViewController.isKind(of: LPSLoginRootController.self)) {
                navc = LPSBaseNavigaionController.init(rootViewController: rootViewController)
                UIApplication.shared.keyWindow?.rootViewController = navc
            }else{
                UIApplication.shared.keyWindow?.rootViewController = rootViewController
            }
            
            UIView.setAnimationsEnabled(oldState)
            
        }
        UIView.transition(with: window!, duration: 0.5, options: UIViewAnimationOptions.transitionCrossDissolve, animations: animation, completion: nil)
        
    }
    
    func setupSubviewsLayout() {
        self.bgView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
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
