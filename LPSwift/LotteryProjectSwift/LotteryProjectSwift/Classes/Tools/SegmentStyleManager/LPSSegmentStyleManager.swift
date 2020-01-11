//
//  LPSSegmentStyleManager.swift
//  LotteryProjectSwift
//
//  Created by avazuholding on 2018/1/5.
//  Copyright © 2018年 Lottery. All rights reserved.
//

import UIKit

final class LPSSegmentStyleManager: NSObject {
    static let shareInstance = LPSSegmentStyleManager();
    var style:SegmentStyle!
    
    private override init() {
        print("Singleton1 初始化了一次")
        self.style = SegmentStyle()
        self.style.showLine = true
        self.style.scrollTitle = false
        self.style.gradualChangeTitleColor = true
        self.style.scrollLineColor = UIColor.lpsThemColor()
        self.style.selectedTitleColor = UIColor.lpsThemColor()
    }
}
