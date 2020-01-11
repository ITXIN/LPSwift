//
//  LPSBaseTableViewController.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2018/1/4.
//  Copyright © 2018年 Lottery. All rights reserved.
//

import UIKit
import MJRefresh
typealias LPSRefreshComponentRefreshingBlock = ()->Void

class LPSBaseTableViewController: LPSBaseViewController {
    
    var _headerRefreshingBlock:LPSRefreshComponentRefreshingBlock?
    var footerRefreshingBlock:LPSRefreshComponentRefreshingBlock?
    let header = MJRefreshNormalHeader()
    
    var dataArr:NSMutableArray!
    
    lazy var tableView:UITableView = {
        
        let tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.showsVerticalScrollIndicator = true
        tableView.backgroundColor = UIColor.clear
        self.bgView.addSubview(tableView)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
        // Do any additional setup after loading the view.
    }
    
    func  tableViewRegisterClass(cellClass:AnyClass,identifier:String) {
        self.tableView.register(cellClass, forCellReuseIdentifier: identifier)
    }
    //必须设置frame否则偏移
    func setupTableviewDelegate(delegate:Any ,frame:CGRect) {
        self.tableView.delegate = (delegate as! UITableViewDelegate)
        self.tableView.dataSource = (delegate as! UITableViewDataSource)
        self.view.frame = frame
        
    }
    var headerRefreshingBlock: LPSRefreshComponentRefreshingBlock?{
        set{
            _headerRefreshingBlock = newValue
            if (self.headerRefreshingBlock != nil) {
                self.header.lastUpdatedTimeLabel.isHidden = true
                self.tableView.mj_header = self.header
                header.beginRefreshing(completionBlock: {
                    self.headerRefresh()
                })
            }
        }
        get{
            return _headerRefreshingBlock
        }
    }
    
    
    // 顶部刷新
    @objc func headerRefresh(){
        print("下拉刷新")
        self.headerRefreshingBlock!()
        
        // 结束刷新
        self.tableView.mj_header.endRefreshing()
        self.tableView.reloadData()
        DispatchQueue.main.async {
            if (self.dataArr.count > self.tableView.visibleCells.count) {
                if (self.tableView.mj_footer != nil){
                    self.tableView.mj_footer.isHidden = false
                }
            }else{
                if (self.tableView.mj_footer != nil){
                    self.tableView.mj_footer.isHidden = true
                }
            }
        }
        
    }
    override func initSubviews() {
        super.initSubviews()
        self.dataArr = NSMutableArray.init()
        
    }
    //要和view一致
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.snp.makeConstraints { (make) in
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
