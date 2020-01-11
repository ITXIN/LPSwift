//
//  LPSMainTabBar.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2017/12/29.
//  Copyright © 2017年 Lottery. All rights reserved.
//

import UIKit

class LPSMainTabBar: UITabBar {

    //重写frame
    override var frame:CGRect{
        didSet {
            if (self.superview != nil && !(self.superview?.bounds.maxY == frame.maxY))  {
                frame.origin.y = (self.superview?.bounds.height)! - frame.height
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isTranslucent = false
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
