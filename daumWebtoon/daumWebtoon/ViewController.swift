//
//  ViewController.swift
//  daumWebtoon
//
//  Created by 황지은 on 2020/08/24.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit
import UINavigationBar_Transparent

class ViewController: UIViewController {
    
    var gradientLayer: CAGradientLayer!
    @IBOutlet var gradientView: UIView!
    @IBOutlet var menuBarCV: UICollectionView!
    @IBOutlet var myScrollView: UIScrollView!
    
    var menuTabNames:[String] = ["TOP","연재","기다무","완결","PICK"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        menuBarCV.delegate = self
        menuBarCV.dataSource = self
        setMenuBarGradient()
        setNavigationItems()
        
        self.navigationController?.navigationBar.setBarColor(UIColor.clear)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBarColor(UIColor.clear)
        
    }
    
    func setNavigationItems(){
        let hambergerImage = UIImage(named: "hamberger")
        let searchImage = UIImage(named: "find")
        let cashImage = UIImage(named: "cash")
//        let costomView = UIImageView(image: UIImage(named: "hamberger"))
//        let customButton = UIBarButtonItem(customView: costomView)
//        // Container가 될 Array를 생성 (혹은 직접 지정하는 방법도 있습니다)
//        var rightBarButtons: [UIBarButtonItem] = []
//        // Array에 버튼 아이템을 추가
//        rightBarButtons.append(customButton)
//        // RightBarButtonItems 배열을 셋업
//        self.navigationItem.rightBarButtonItems = rightBarButtons
        let hambergerButton = UIBarButtonItem(image: hambergerImage,  style: .plain, target: self, action: #selector(didTapEditButton(sender:)))
        let searchButton = UIBarButtonItem(image: searchImage,  style: .plain, target: self, action: #selector(didTapSearchButton(sender:)))
        let cashButton = UIBarButtonItem(image: cashImage,  style: .plain, target: self, action: #selector(didTapCashButton(sender:)))

        self.navigationItem.rightBarButtonItems = [hambergerButton, searchButton]
    }
    
    
    @objc func didTapEditButton(sender: AnyObject){
        
    }
    
    @objc func didTapSearchButton(sender: AnyObject){
        
    }
    
    @objc func didTapCashButton(sender: AnyObject){
           
    }
    

    func setMenuBarGradient(){
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.frame = self.view.bounds
        self.gradientLayer.colors = [UIColor.systemPurple.cgColor,UIColor.systemRed.cgColor,UIColor.systemPurple.cgColor,UIColor.cyan.cgColor,UIColor.systemBlue.cgColor]
        self.gradientView.layer.addSublayer(self.gradientLayer)
        
        //gradient를 가로로 만들어주는 시작점과 끝점 포인트!!
        self.gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        self.gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
    }

}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTabNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let menuBarCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuBarCVCell", for: indexPath) as! menuBarCVCell
        menuBarCell.menuBarLabel.text = menuTabNames[indexPath.row]
        
        //여기가 첫번째 아이템 select하게 해주는 부분
        if indexPath.item == 0 {
           menuBarCell.isSelected = true
              collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
        }
      
        return menuBarCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
   }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(myScrollView.contentOffset.y)
        var offset = myScrollView.contentOffset.y / 360
        if offset > 1 {
            offset = 1
            let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            self.navigationController?.navigationBar.backgroundColor = color

            let statusBar =  UIView()
            statusBar.frame = UIApplication.shared.statusBarFrame
            statusBar.backgroundColor = color
            UIApplication.shared.keyWindow?.addSubview(statusBar)
        }
        else {
            let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
            self.navigationController?.navigationBar.backgroundColor = color

            let statusBar =  UIView()
            statusBar.frame = UIApplication.shared.statusBarFrame
            statusBar.backgroundColor = color
            UIApplication.shared.keyWindow?.addSubview(statusBar)
        }
    }
    
    
}

