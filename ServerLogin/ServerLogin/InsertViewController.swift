//
//  InsertViewController.swift
//  ServerLogin
//
//  Created by 황지은 on 2020/06/07.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class InsertViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    //navigationControllerDelegate : 전환기능
    
    @IBOutlet var textName: UITextField!
    @IBOutlet var textDescription: UITextView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var buttonCamera: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if !(UIImagePickerController.isSourceTypeAvailable(.camera)) {
            let alert = UIAlertController(title: "Error!", message: "Device has no Camera!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert,animated: true)
            buttonCamera.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    //서버에 저장하는 함수
    @IBAction func saveFavorite(_ sender: UIBarButtonItem) {
        let name = textName.text!
        let description = textDescription.text!
        if(name == "" || description == "" ){
            let alert = UIAlertController(title: "제목/설명을 입력하세요", message: "Save failed!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                action in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true)
            return
        }
        
        guard let myImage = imageView.image else {
            let alert = UIAlertController(title: "이미지를 선택하세요", message: "Save Failed", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                action in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true)
            return
        }
        
        print(myImage)
        
        
        //이미지 추가 - apache 서버를 통해 !
        let myUrl = URL(string: "http://condi.swu.ac.kr/student/favorite/upload.php");
        
        var request = URLRequest(url:myUrl!);
        
        request.httpMethod = "POST";
        
        let boundary = "Boundary-\(NSUUID().uuidString)"
        
        request.setValue("multipart/form-data; boundary=\(boundary)",
            forHTTPHeaderField: "Content-Type")
        
        guard let imageData = myImage.jpegData(compressionQuality:1) else { return }
        
        var body = Data()
        var dataString = "--\(boundary)\r\n"
        dataString += "Content-Disposition: form-data; name=\"userfile\"; filename=\".jpg\"\r\n"
        dataString += "Content-Type: application/octet-stream\r\n\r\n"
        if let data = dataString.data(using: .utf8) { body.append(data) }
        
        // imageData 위 아래로 boundary 정보 추가
        body.append(imageData)
        dataString = "\r\n"
        dataString += "--\(boundary)--\r\n"
        
        if let data = dataString.data(using: .utf8) { body.append(data) }
        
        request.httpBody = body
        
        var imageFileName: String = ""
        let semaphore = DispatchSemaphore(value: 0)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else { print("Error: calling POST"); return; }
            guard let receivedData = responseData else {
                print("Error: not receiving Data")
                return;
            }
            if let utf8Data = String(data: receivedData, encoding: .utf8) {
                // 서버에 저장한 이미지 파일 이름
                imageFileName = utf8Data
                print(imageFileName)
                semaphore.signal()
            }
        }
        task.resume()
        // 이미지 파일 이름을 서버로 부터 받은 후 해당 이름을 DB에 저장하기 위해 wait()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        
        let urlString: String = "http://condi.swu.ac.kr/student/favorite/insertFavorite.php"
        guard let requestURL = URL(string: urlString) else { return }
        request = URLRequest(url: requestURL)
        request.httpMethod = "POST"
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        guard let userID = appDelegate.ID else { return }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let myDate = formatter.string(from: Date())
        var restString: String = "id=" + userID + "&name=" + name
        restString += "&description=" + description
        restString += "&image=" + imageFileName + "&date=" + myDate
        request.httpBody = restString.data(using: .utf8)
        let session2 = URLSession.shared
        let task2 = session2.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else { return }
            guard let receivedData = responseData else { return }
            if let utf8Data = String(data: receivedData, encoding: .utf8) { print(utf8Data) }
        }
        task2.resume()
        _ = self.navigationController?.popViewController(animated: true)
    }
        
    
    
    @IBAction func takePicture(_ sender: UIButton) {
        
        let myPicker = UIImagePickerController()
        myPicker.delegate = self
        myPicker.allowsEditing = true
        myPicker.sourceType = .camera
        self.present(myPicker,animated: true,completion: nil)
        
    }
    
    @IBAction func selectPicture(_ sender: UIButton) {
        let myPicker = UIImagePickerController()
        myPicker.delegate = self
        myPicker.sourceType = .photoLibrary
        self.present(myPicker, animated: true, completion: nil)
    }
    
    //앨범에서 이미지 선택을 위한 함수
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    //카메라 앨범에서 사진을 선택하지 않았을 때 호출
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
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
