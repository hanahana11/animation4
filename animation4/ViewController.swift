//
//  ViewController.swift
//  animation4
//
//  Created by 末利　花 on 2019/01/04.
//  Copyright © 2019年 末利　花. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        makePieChart()
        
    }
    
    override func didReceiceMemoeyWarning(){
        super.didReceiveMemoryWarning()
        
    }

    func makeSet(values: [Double]) -> (types: [ActivityType], values: [Double]) {
        let minutesValues = values.map{$0 * 60}
        let types: [ActivityType] = [.walking, .blank, .training, .blank]
        return (types, minutesValues)
        
    }

    func change(types: [ActivityType], values: [Double]) {
        guard let dataSet = pieChart.data?.dataSets.first as? PieChartDataSet else {
            fatalError()
        }
        
        let entries = values.map{PieChartDataEntry(value: Double($0))}
        dataSet.valueFormatter = CustomLabelFormatter(types, values: values)
        pieChart.notifyDataSetChanged()
        
    }
    
    func makePieChart() {
        let hourValues = [8,4,2,9.6,0.4]
        let minutesValues = hourValues.map{$0 * 60}
        let types: [activityType] = [.walking, .blank, .training, .blank, training]
        
        let entries = minutesValues.map{ element -> PieChartDataEntry in
            let value = Double(element)
            return PieChartDataEntry(value: value)
        }
        
        let dataSet = PieChartDataSet(values: entries, label: "")
        
        dataSet.colors = [.purple, .gray, .blue, .gray, .blue]
        dataSet.valueFormatter = CustomLabelFomatter(types: types, values:
    
        minutesValues)
        
        let data = PieChartData(dataSets: dataSet)
        pieChart.data = data
        
    }
}

enum ActivityType: String {
    case walking = "ウォーキング"
    case training = "tトレーニング"
    case blank = "空白"
    
}

class CustomLabelFomatter: NSObject, IValueFormatter {
    
    let types = [ActivityType]
    
    let values = [Double]
    
    init(types: [ActivityType], values: [Double]) {
        self.types = types
        self.values = values
    }
    
    func convert(value: Double) -> String {
        guard let convertedString = values
             .enumerated()
            .filter($0.element == value})
    .map({ tuple -> String in
    
    let index = tuple.offset
    let type = types[index]
    
    if value < 0.5 * 60 {
    print("早期リターン")
    return ""
    
    
    }
    
    print("処理継続中")
    
    switch type {
    
    case .blank: return ""
    default: return type.rawValue
    
    }
    
    }).first else {fatalError()}
    
    return convertedString

}

func stringForValue(_ value: Double, entry: ChartDataEntry, dataSerIndex: Int,
                    viewPortHandler: ViewPortHandler?) -> String {
    print(value)
    return convert(value: value)
  }


