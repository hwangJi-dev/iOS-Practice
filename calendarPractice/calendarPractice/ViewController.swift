//
//  ViewController.swift
//  calendarPractice
//
//  Created by 황지은 on 2020/07/03.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController,ChartViewDelegate {

    @IBOutlet var chartView: BarChartView!
    var months: [String]!
     
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        chartView.delegate = self
        
        months = ["일","월","화","수","목","금","토"]
               
               
               // 이 값 순서대로 그래프가 그려짐
               let uniteSold = [2.0,11.0,9.0,10.0,3.0,4.0,2.0]
               
               setChart(dataPoints: months, values: uniteSold)
    }
    
    
    

        func setChart(dataPoints: [String], values: [Double]) {
    //        myview.noDataText = "You need to provide data for the chart."
            
            var dataEntries : [BarChartDataEntry] = []
            
            //dataPoint.count (배열의 값만큼 막대가 생긴다)
            for i in 0..<dataPoints.count {
                let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
                dataEntries.append(dataEntry)
                print(values[i])
            }
            
            
            
            //chartDataSet의 label은 그래프 하단 데이터셋의 네이밍을 의미한다.
            let chartDataSet = BarChartDataSet(entries:dataEntries, label: "그래프 값 명칭")
            
            
            

            
            
            //그래프 색 변경 부분
            
    //        chartDataSet.colors = [UIColor(red: 246.0/255.0, green: 187.0/255.0, blue: 51.0/255.0, alpha: 1.0),UIColor(red: 246.0 / 255.0, green: 187.0 / 255.0, blue: 51.0 / 255.0, alpha: 1.0)]
            
            print(values[1])
            chartDataSet.colors = [setColor(value: values[0]),setColor(value: values[1]),setColor(value: values[2]),setColor(value: values[3]),setColor(value: values[4]),setColor(value: values[5]),setColor(value: values[6])]
            
         
            
            
            let chartData = BarChartData(dataSet: chartDataSet)
            chartView.data = chartData
            chartView.xAxis.labelPosition = .bottom
            chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
            
            chartView.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
            chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)

          //  batChart.layer.cornerRadius = 50
            //batChart.
            
            let ll = ChartLimitLine(limit: 3.0)
            chartView.rightAxis.addLimitLine(ll)
            ll.lineWidth = 0.3
           
            
            chartData.barWidth = 0.2
            
            
            chartView.leftAxis.drawGridLinesEnabled = false
            chartView.rightAxis.drawGridLinesEnabled = false
            chartView.xAxis.drawGridLinesEnabled = false
          
            chartView.drawGridBackgroundEnabled = false
            
            //좌측 Axis 선 제거
            chartView.leftAxis.drawAxisLineEnabled = false
      
            //우측 Axis 선 제거
            chartView.rightAxis.drawAxisLineEnabled = false
            
            //좌측 숫자 라벨 재거
            chartView.leftAxis.drawLabelsEnabled = false
            
            //우측 숫자 라벨 재거
            chartView.rightAxis.drawLabelsEnabled = false

            
            chartView.drawBarShadowEnabled = false
            
            //chartView.draw
        }
        
        
     
        
        func setColor(value: Double) -> UIColor {
            if (value <= 3.0) {
                return UIColor(red: 246.0 / 255.0, green: 187.0 / 255.0, blue: 51.0 / 255.0, alpha: 1.0)
            }

                return UIColor(white: 206.0 / 255.0, alpha: 1.0)
            
           
        }


}

