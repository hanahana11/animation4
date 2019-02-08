//
//  ViewController.swift
//  animation4
//
//  Created by 末利　花 on 2019/01/04.
//  Copyright © 2019年 末利　花. All rights reserved.
//

//import UIKit
//import Charts
//
//class ViewController: UIViewController {
//
//    @IBOutlet weak var pieChart: PieChartView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        makePieChart()
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//
//    func makeSet(values: [Double]) -> (types: [ActivityType], values: [Double]) {
//        let minutesValues = values.map{$0 * 60}
//        let types: [ActivityType] = [.sleeping, .blank, .training, .blank]
//        return (types, minutesValues)
//
//    }
//
//    func change(types: [ActivityType], values: [Double]) {
//        guard let dataSet = pieChart.data?.dataSets.first as? PieChartDataSet else {
//            fatalError()
//        }
//
//        let entries = values.map{PieChartDataEntry(value: Double($0))}
//        dataSet.values = entries
//        dataSet.valueFormatter = CustomLabelFomatter(types: types, values: values)
//        pieChart.notifyDataSetChanged()
//
//    }
//
//    func makePieChart() {
//        let hourValues = [10.0, 2.0]
//        let minutesValues = hourValues.map{$0 * 60}
//        let types: [ActivityType] = [.sleeping, .blank, .training, .blank, .training]
//
//        let entries = minutesValues.map{ element -> PieChartDataEntry in
//            let value = Double(element)
//            return PieChartDataEntry(value: value)
//        }
//
//        let dataSet = PieChartDataSet(values: entries, label: "")
//
//        dataSet.colors = [.purple, .gray, .blue, .gray, .blue]
//        dataSet.valueFormatter = CustomLabelFomatter(types: types, values:
//
//        minutesValues)
//
//        let data = PieChartData(dataSet: dataSet)
//        pieChart.data = data
//
//    }
//}
//
//enum ActivityType: String {
//    case sleeping = "睡眠"
//    case training = "トレーニング"
//    case blank = "空白"
//}
//
//class CustomLabelFomatter: NSObject, IValueFormatter {
//
//
//
//    var types = [ActivityType]()
//
//    var values = [Double]()
//
//    init(types: [ActivityType], values: [Double]) {
//        self.types = types
//        self.values = values
//    }
//
//    func convert(value: Double) -> String {
//        guard let convertedString = values
//             .enumerated()
//            .filter({$0.element == value})
//    .map({ tuple -> String in
//
//    let index = tuple.offset
//    let type = types[index]
//
//    if value < 0.5 * 60 {
//    print("早期リターン")
//    return ""
//
//
//    }
//
//    print("処理継続中")
//
//    switch type {
//
//    case .blank: return ""
//    default: return type.rawValue
//
//    }
//
//    }).first else {fatalError()}
//
//    return convertedString
//
//}
//
//    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex dataSerIndex: Int,
//                    viewPortHandler: ViewPortHandler?) -> String {
//    print(value)
//    return convert(value: value)
//  }
//
//
//}
import UIKit
import Charts
//
//
//        // Do any additional setup after loading the view, typically from a nib.
//
//
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // UIPickerView.
    @IBOutlet var myUIPicker: UIPickerView!
//    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var pieChart: PieChartView!
    
    // 表示する値の配列.
    var dataArray:[Int] = ([Int])(0...100)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIPickerViewを生成.
        //        myUIPicker = pickerView()
        
        // サイズを指定する.
        myUIPicker.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 180.0)
        
        // Delegateを設定する.
        myUIPicker.delegate = self
        
        // DataSourceを設定する.
        myUIPicker.dataSource = self
        
        // Viewに追加する.
        self.view.addSubview(myUIPicker)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /*
     pickerに表示する行数を返すデータソースメソッド.
     (実装必須)
     */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    /*
     pickerに表示する値を返すデリゲートメソッド.
     */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(dataArray[row])
    }
    
    /*
     pickerが選択された際に呼ばれるデリゲートメソッド.
     */
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row)")
        print("value: \(dataArray[row])")
    }
    
    func makeSet(values: [Double]) -> (types: [ActivityType], values: [Double]) {
        let minutesValues = values.map{$0 * 60}
        let types: [ActivityType] = [.sleeping, .blank, .training, .blank]
        return (types, minutesValues)
        
    }
    
    func change(types: [ActivityType], values: [Double]) {
        guard let dataSet = pieChart.data?.dataSets.first as? PieChartDataSet else {
            fatalError()
        }
        
        let entries = values.map{PieChartDataEntry(value: Double($0))}
        dataSet.values = entries
        dataSet.valueFormatter = CustomLabelFomatter(types: types, values: values)
        pieChart.notifyDataSetChanged()
        
    }
    
    func makePieChart() {
        let hourValues = [10.0, 2.0]
        let minutesValues = hourValues.map{$0 * 60}
        let types: [ActivityType] = [.sleeping, .blank, .training, .blank, .training]
        
        let entries = minutesValues.map{ element -> PieChartDataEntry in
            let value = Double(element)
            return PieChartDataEntry(value: value)
        }
        
        let dataSet = PieChartDataSet(values: entries, label: "")
        
        dataSet.colors = [.purple, .gray, .blue, .gray, .blue]
        dataSet.valueFormatter = CustomLabelFomatter(types: types, values:
            
            minutesValues)
        
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //class ViewController: UIViewController {
    
    //    @IBOutlet weak var pieChart: PieChartView!
    
    //func viewDidLoad() {
    //        super.viewDidLoad()
    //        // Do any additional setup after loading the view, typically from a nib.
    //        makePieChart()
    
}

//func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }


//func makeSet(values: [Double]) -> (types: [ActivityType], values: [Double]) {
//    let minutesValues = values.map{$0 * 60}
//    let types: [ActivityType] = [.sleeping, .blank, .training, .blank]
//    return (types, minutesValues)
//
//}
//
//func change(types: [ActivityType], values: [Double]) {
//    guard let dataSet = PieChart.data?.dataSets.first as? PieChartDataSet else {
//        fatalError()
//    }
//
//    let entries = values.map{PieChartDataEntry(value: Double($0))}
//    dataSet.values = entries
//    dataSet.valueFormatter = CustomLabelFomatter(types: types, values: values)
//    PieChart.notifyDataSetChanged()
//
//}
//
//func makePieChart() {
//    let hourValues = [10.0, 2.0]
//    let minutesValues = hourValues.map{$0 * 60}
//    let types: [ActivityType] = [.sleeping, .blank, .training, .blank, .training]
//
//    let entries = minutesValues.map{ element -> PieChartDataEntry in
//        let value = Double(element)
//        return PieChartDataEntry(value: value)
//    }
//
//    let dataSet = PieChartDataSet(values: entries, label: "")
//
//    dataSet.colors = [.purple, .gray, .blue, .gray, .blue]
//    dataSet.valueFormatter = CustomLabelFomatter(types: types, values:
//
//        minutesValues)
//
//    let data = PieChartData(dataSet: dataSet)
//    PieChart.data = data
//
//}


enum ActivityType: String {
    case sleeping = "睡眠"
    case training = "トレーニング"
    case blank = "空白"
}

class CustomLabelFomatter: NSObject, IValueFormatter {
    
    
    
    var types = [ActivityType]()
    
    var values = [Double]()
    
    init(types: [ActivityType], values: [Double]) {
        self.types = types
        self.values = values
    }
    
    func convert(value: Double) -> String {
        guard let convertedString = values
            .enumerated()
            .filter({$0.element == value})
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
    
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex dataSerIndex: Int,
                        viewPortHandler: ViewPortHandler?) -> String {
        print(value)
        return convert(value: value)
    }
    
    
}

