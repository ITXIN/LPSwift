//
//  LPSBaseNavigaionController.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2017/12/29.
//  Copyright © 2017年 Lottery. All rights reserved.
//

import UIKit

class LPSBaseNavigaionController: UINavigationController,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
        self.navigationBar.isTranslucent = false;
        self.navigationBar.backIndicatorImage = UIImage.init(named: "icon_navigation_back")
        self.navigationBar.backIndicatorTransitionMaskImage =  UIImage.init(named: "icon_navigation_back")
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.titleTextAttributes = {[
            NSAttributedStringKey.foregroundColor: UIColor.white,
//            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)
            ]}()
        self.navigationBar.shadowImage = UIImage.init()
        self.navigationBar.setBackgroundImage(LPSProjectHelper.getImage(color: UIColor.lpsThemColor(), rect: CGRect.init(x: 0, y: 0, width: 1, height: 1)), for: UIBarMetrics.default)

    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return (self.topViewController?.preferredStatusBarStyle)!
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count >= 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        self.navigationController?.pushViewController(viewController, animated: animated)
        super.pushViewController(viewController, animated: animated)
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
