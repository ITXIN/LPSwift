//
//  LPSMainViewController.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2017/12/29.
//  Copyright © 2017年 Lottery. All rights reserved.
//

import UIKit

class LPSMainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initTabbarItems()
    }
    func initTabbarItems() {
        self.setValue(LPSMainTabBar.init(), forKey: "tabBar")
        self.tabBar.backgroundImage = LPSProjectHelper.getImage(color: UIColor.white,rect: CGRect.init(x: 0, y: 0, width: 1, height: 1 ))
        let navigationsArr = NSMutableArray()
        var imagesNormalArr = ["tab_order_nor","tab_user_nor","tab_data_nor","tab_mine_nor"]
        let imagesSeletedArr = ["tab_order_pre","tab_user_pre","tab_data_pre","tab_mine_pre"]
        let tabBarTitlesArr = ["订单管理","用户管理","数据统计","个人中心"]
        let vcArr = [LPSOrderManagerController(),LPSOrderManagerController(),LPSOrderManagerController(),LPSPCViewController(),]
        for i  in 0...3 {
            let vc = vcArr[i]
            vc.title = tabBarTitlesArr[i]
            let nav =  LPSBaseNavigaionController.init(rootViewController: vc)
            let tabBarItem = UITabBarItem.init(title: tabBarTitlesArr[i], image: UIImage.init(named: imagesNormalArr[i]), selectedImage: UIImage.init(named: imagesSeletedArr[i]))
            nav.tabBarItem = tabBarItem
            nav.title = tabBarTitlesArr[i]
            
            navigationsArr.add(nav)
            
        }
        self.setViewControllers((navigationsArr as! [UIViewController]), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
