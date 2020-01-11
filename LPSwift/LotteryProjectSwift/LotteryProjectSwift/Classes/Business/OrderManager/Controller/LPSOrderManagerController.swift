//
//  LPSOrderManagerController.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2017/12/29.
//  Copyright © 2017年 Lottery. All rights reserved.
//

import UIKit


class LPSOrderManagerController: LPSBaseViewController,UITableViewDelegate,UITableViewDataSource {
    let personalCenterCellIdentifier = "personalCenterCellIdentifier"
    
    var orderTableVC :LPSBaseTableViewController!
    var togetherTableVC: LPSBaseTableViewController!
    var followOrderTableVC :LPSBaseTableViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func initSubviews() {
        super.initSubviews()
        self.bgView.backgroundColor = UIColor.yellow
        
        let childVCs = setChildVCs()
        let titls = ["订单","合买","跟单"]
        let  scrollPageView = ScrollPageView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kStatusBarAndNavigationBarAndTabbarHeightHeight), segmentStyle: LPSSegmentStyleManager.shareInstance.style, titles: titls, childVcs: childVCs, parentViewController: self)

        
//        print(scrollPageView,kScreenHeight, kStatusBarAndNavigationBarAndTabbarHeightHeight)
        self.view.addSubview(scrollPageView)
        scrollPageView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(self.bgView)
            make.bottom.top.equalTo(0)
        }
    }
    func setChildVCs() -> [UIViewController] {
        LPLog("setChildVCs")
        self.orderTableVC = LPSBaseTableViewController()
        self.togetherTableVC = LPSBaseTableViewController()
        self.followOrderTableVC = LPSBaseTableViewController()

        orderTableVC.dataArr = NSMutableArray.init(array:["未出票","派奖","提现","充值","我的推广助手","下载我的彩民端","彩种管理","出票管理","投注查询","使用教程","账户明细","设置"])
        togetherTableVC.dataArr = NSMutableArray.init(array:["未出票","派奖","提现","充值","我的推广助手","下载我的彩民端","彩种管理","出票管理","投注查询","使用教程","账户明细","设置"])
        followOrderTableVC.dataArr = NSMutableArray.init(array:["未出票","派奖","提现","充值","我的推广助手","下载我的彩民端","彩种管理","出票管理","投注查询","使用教程","账户明细","设置"])
        
        
        orderTableVC.setupTableviewDelegate(delegate: self, frame: self.view.bounds)
        togetherTableVC.setupTableviewDelegate(delegate: self, frame: self.view.bounds)
        followOrderTableVC.setupTableviewDelegate(delegate: self, frame: self.view.bounds)
        
        orderTableVC.tableViewRegisterClass(cellClass: LPSPCCell.self, identifier: personalCenterCellIdentifier)
        
        togetherTableVC.tableViewRegisterClass(cellClass: LPSPCCell.self, identifier: personalCenterCellIdentifier)
        followOrderTableVC.tableViewRegisterClass(cellClass: LPSPCCell.self, identifier: personalCenterCellIdentifier)
        
        self.orderTableVC.headerRefreshingBlock = {
            var num = arc4random()%10
            num = 15
            self.orderTableVC.dataArr.removeAllObjects()
            for i  in 0...num+1 {
                self.orderTableVC.dataArr.add("order")
            }
            
        }
        
        
        return [orderTableVC,togetherTableVC,followOrderTableVC]
    }
    
    //UITableviewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.isEqual(self.orderTableVC.tableView) {
            return self.orderTableVC.dataArr.count
        }
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
   
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let orderManagerDetailVC = LPSOrderManagerDetailController()
//                self.restoreRootViewController(rootViewController: orderManagerDetailVC)
        self.navigationController?.pushViewController(orderManagerDetailVC, animated: true)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCell(withIdentifier: personalCenterCellIdentifier, for: indexPath) as! LPSPCCell
        if tableView.isEqual(orderTableVC.tableView) {
            let dataArr = orderTableVC.dataArr
            cell.leftTitleLab.text = dataArr![indexPath.row] as? String
        }else{
            cell.leftTitleLab.text = "fdsfids "
        }
        cell.leftImageView.image = UIImage.init(named: "icon_paijiang")
        //        cell.rightTitleLab.text = dataArr?[indexPath.row+indexPath.section*4] as? String
        
        return cell
    }
    
}
