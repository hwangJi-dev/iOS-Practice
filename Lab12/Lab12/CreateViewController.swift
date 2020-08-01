//
//  CreateViewController.swift
//  Lab12
//
//  Created by 황지은 on 2020/06/14.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var textPrefix: UITextField!
    @IBOutlet var textID: UITextField!
    @IBOutlet var textPassword: UITextField!
    @IBOutlet var textName: UITextField!
    @IBOutlet var labelStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.textPrefix {
                   textField.resignFirstResponder()
                   self.textID.becomeFirstResponder() //ID 입력 후 비번으로 이동
               }
               else if textField == self.textID {
                   textField.resignFirstResponder()
                   self.textPassword.becomeFirstResponder() //비번 입력 후 이름으로 이동
               }
        else if textField == self.textPassword {
                          textField.resignFirstResponder()
                          self.textName.becomeFirstResponder() //비번 입력 후 이름으로 이동
                      }
        else if textField == self.textPassword {
                             textField.resignFirstResponder()
                             self.textName.becomeFirstResponder() //비번 입력 후 이름으로 이동
                         }
               textField.resignFirstResponder()
               return true
    }
    
    @IBAction func buttonSave(_ sender: UIButton) {
        
        
               // 필요한 네 가지 자료가 모두 입력 되었는지 확인
               if textPrefix.text == "" {
                          labelStatus.text = "ID를 입력하세요"; return;
                      }
               if textID.text == "" {
                   labelStatus.text = "ID를 입력하세요"; return;
               }
               if textPassword.text == "" {
                   labelStatus.text = "Password를 입력하세요"; return;
               }
               if textName.text == "" {
                   labelStatus.text = "사용자 이름을 입력하세요"; return;
               }
        let urlString: String = "http://condi.swu.ac.kr/student/\(String(describing: textPrefix.text!))/login/insertUser.php"
        print(urlString)
               guard let requestURL = URL(string: urlString) else {
                   return
               }
               var request = URLRequest(url: requestURL)
               request.httpMethod = "POST"
               let restString: String = "id=" + textID.text! + "&password=" + textPassword.text!
                   + "&name=" + textName.text!
               request.httpBody = restString.data(using: .utf8)
               self.executeRequest(request: request)
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
                       self.labelStatus.text = utf8Data
                       print(utf8Data) // php에서 출력한 echo data가 debug 창에 표시됨
                   }
               }
           }
           task.resume()
       }
    
    
    @IBAction func buttonBack(_ sender: UIButton) {
        
         self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
