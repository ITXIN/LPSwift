//
//  LPSPCViewController.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2018/1/4.
//  Copyright © 2018年 Lottery. All rights reserved.
//

import UIKit

class LPSPCViewController: LPSBaseTableViewController,UITableViewDataSource,UITableViewDelegate {
    var headerView:LPSPCHeaderView!
    
    let personalCenterCellIdentifier = "personalCenterCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func initSubviews() {
        super.initSubviews()
        self.dataArr = NSMutableArray.init(array:["未出票","派奖","提现","充值","我的推广助手","下载我的彩民端","彩种管理","出票管理","投注查询","使用教程","账户明细","设置"])
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableViewRegisterClass(cellClass: LPSPCCell.self, identifier: personalCenterCellIdentifier)
//        let H = kiPhoneX ? kNavigationBarHeight :0
//        LPLog(H)
        self.headerView =  LPSPCHeaderView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: Double(kScreenWidth), height: 263.0))
        self.tableView.tableHeaderView = self.headerView
    }
    
    
    //UITableviewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section==0{
            return 0.001
        }else{
            return 15
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let loginRootVC = LPSLoginRootController()
        self.restoreRootViewController(rootViewController: loginRootVC)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: personalCenterCellIdentifier, for: indexPath) as! LPSPCCell
        cell.leftTitleLab.text = self.dataArr[indexPath.row+indexPath.section*4] as? String
        cell.leftImageView.image = UIImage.init(named: "icon_paijiang")
        cell.rightTitleLab.text = self.dataArr[indexPath.row+indexPath.section*4] as? String
        
        return cell
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
