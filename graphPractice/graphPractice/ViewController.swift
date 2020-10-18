//
//  ViewController.swift
//  graphPractice
//
//  Created by 황지은 on 2020/10/18.
//


import Charts
import UIKit

class ViewController: UIViewController {
    
    var dataPoints: [String] = ["일","월","화","수","목","금","토"] //dataPoints
    var dataEntries : [BarChartDataEntry] = [] //실질적인 data 배열으로, BarChartDataEntry형 배열을 선언해줘야햠
    var dataArray:[Int] = [10,5,6,13,15,8,2] //y축의 데이터가 될 data 배열
    
    @IBOutlet var barGraphView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGraph()
        // Do any additional setup after loading the view.
    }
    
    
    func setGraph(){
        
        
        for i in 0...6 {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            dataEntries.append(dataEntry)
        }
        
        let valFormatter = NumberFormatter()
        valFormatter.numberStyle = .currency
        valFormatter.maximumFractionDigits = 2
        valFormatter.currencySymbol = "$"
        
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        
        
        //chartDataSet의 label은 그래프 하단 데이터셋의 네이밍을 의미한다.
        let chartDataSet = BarChartDataSet(entries:dataEntries, label: "그래프 값 명칭")
        let chartData = BarChartData(dataSet: chartDataSet)
        chartData.setValueFormatter(formatter)
        barGraphView.leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: valFormatter)
        
        
        barGraphView.data = chartData
    }
    
}
