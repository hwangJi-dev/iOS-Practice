//
//  ViewController.swift
//  Lab12
//
//  Created by 황지은 on 2020/06/14.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var loginPrefix: UITextField!
    @IBOutlet var loginUserId: UITextField!
    @IBOutlet var loginPassword: UITextField!
    @IBOutlet var labelStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.loginPrefix {
                  textField.resignFirstResponder()
                  self.loginUserId.becomeFirstResponder()
              }
        else if textField == self.loginUserId {
                          textField.resignFirstResponder()
                          self.loginPassword.becomeFirstResponder() //비번 입력 후 이름으로 이동
                      }
              textField.resignFirstResponder()
              return true
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if loginPrefix.text == "" {
                         labelStatus.text = "Prefix를 입력하세요"; return;
                     }
        
        if loginUserId.text == "" {
                  labelStatus.text = "ID를 입력하세요"; return;
              }
              if loginPassword.text == "" {
                  labelStatus.text = "비밀번호를 입력하세요"; return;
              }
        let urlString: String = "http://condi.swu.ac.kr/student/\(String(describing: loginPrefix.text!))/login/loginUser.php"
        print(urlString)
              guard let requestURL = URL(string: urlString) else {
                  return
              }
              self.labelStatus.text = " "
              
              var request = URLRequest(url: requestURL)
              request.httpMethod = "POST"
              let restString: String = "id=" + loginUserId.text! + "&password=" + loginPassword.text!
              
              request.httpBody = restString.data(using: .utf8)
              
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
                  do {
                      let response = response as! HTTPURLResponse
                      if !(200...299 ~= response.statusCode) {
                          print ("HTTP Error!")
                          return
                      }
                      guard let jsonData = try JSONSerialization.jsonObject(with: receivedData,
                                                                            options:.allowFragments) as? [String: Any] else {
                                                                              print("JSON Serialization Error!")
                                                                              return
                      }
                      guard let success = jsonData["success"] as? String else {
                          print("Error: PHP failure(success)")
                          return
                      }
                      if success == "YES" {
                          if let name = jsonData["name"] as? String {
                              DispatchQueue.main.async {
                                  self.labelStatus.text = name + "님 안녕하세요?"
                                  
                                  //appDelegate : UI
                                  let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                  appDelegate.loginPrefix = self.loginPrefix.text
                                  
                                  //JsonEncoding이 된 username
                                  appDelegate.userName = name
                                  
                                  let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                  let naviViewController =
                                      storyboard.instantiateViewController(withIdentifier: "myView")
                                  naviViewController.modalPresentationStyle = .fullScreen
                                  self.present(naviViewController, animated: true, completion: nil)
                              }
                          }
                      } else {
                          if let errMessage = jsonData["error"] as? String {
                              DispatchQueue.main.async {
                                  self.labelStatus.text = errMessage }
                          }
                      }
                      
                  } catch {
                      print("Error: \(error)")
                  }
              }
              task.resume()
          }
    }
    


