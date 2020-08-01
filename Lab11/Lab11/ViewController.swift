//
//  ViewController.swift
//  Lab11
//
//  Created by 황지은 on 2020/06/07.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
   
    
    

    
    @IBOutlet var picker: UIPickerView!
    @IBOutlet var labelResult: UILabel!
    
    var monthArray:[String] = Array()
    var dayArray:[String] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...12 { monthArray.append("\(i)") }
        for i in 1...31 { dayArray.append("\(i)")}
        
    }

    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 2
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          
          if component == 0 {
              return monthArray.count
          }
          
          else {
              return dayArray.count
          }
          
      }
      
      
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          if component == 0 {
              return monthArray[row]
          }
          else{
              return dayArray[row]
          }
      }
    
    
    @IBAction func whatDay(_ sender: UIButton) {
        
        let urlString: String = "http://condi.swu.ac.kr/student/labs/findWhatDay.php"
        guard let requestURL = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        
        let restString: String = "month=" + monthArray[self.picker.selectedRow(inComponent: 0)] + "&day=" + dayArray[self.picker.selectedRow(inComponent: 1)]
               
               request.httpBody = restString.data(using: .utf8)
               executeRequest(request: request)
               
           }
        
         func executeRequest (request: URLRequest) -> Void {
             let session = URLSession.shared
             let task = session.dataTask(with: request) { (responseData, response, responseError) in
                 guard responseError == nil else {
                     print("Error: calling POST")
                     return
                 }
                 guard let receivedData = responseData else {
                     print("Error: not receiving Data")
                     return
                 }
                 if let utf8Data = String(data: receivedData, encoding: .utf8) {
                     DispatchQueue.main.async { // for Main Thread Checker
                         self.labelResult.text = utf8Data
                         print(utf8Data) // php에서 출력한 echo data가 debug 창에 표시됨
                     }
                 }
             }
             task.resume()
         }

        
        
    }
    


