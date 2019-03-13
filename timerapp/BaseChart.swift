//
//  BaseChart.swift
//  animation4
//
//  Created by 末利　花 on 2019/01/05.
//  Copyright © 2019年 末利　花. All rights reserved.
//

import UIKit
import Charts

class BaseChart: UIView {
    @IBOutlet weak var chartView: PieChartView!
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func setupGraph() {
        
        chartView.usePercentValuesEnabled = true
        
        let values: [Double] = [0,1,1,1,1]
        let date: [Double] = [1,2,3,4,5]
        var entries: [ChartDataEntry] = Array()
        for (i, value) in values.enumerated(){
            entries.append(ChartDataEntry(x: date[i],y: value, icon: UIImage(named:
                "icon", in: Bundle(for: self.classForCoder),compatibleWith: nil)))
        }
        
        
        let dateSet = PieChartDataSet(values: entries, label: "ラベル")
        
        dateSet.colors =
         ChartColorTemplates.vordiplom()
        
        let chartDate = PieChartData(dataSet: dateSet)
        
        chartView.data = chartDate
        
        
    }

}
