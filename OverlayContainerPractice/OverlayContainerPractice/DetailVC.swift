//
//  DetailVC.swift
//  OverlayContainerPractice
//
//  Created by 황지은 on 2021/01/01.
//

import UIKit


class DetailVC: UIViewController {

    @IBOutlet var cherishPersonCV: UICollectionView!
    @IBOutlet var header: UIView!
    var cherishData:[CherishData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.cornerRadius = 30
        header.clipsToBounds = true
        header.layer.cornerRadius = 30
        header.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        setData()
        cherishPersonCV.delegate = self
        cherishPersonCV.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func setData(){
        cherishData.append(contentsOf: [
            CherishData(nickName: "남쿵둥이", plantImgName: "mainImgUser1", selected: true),
            CherishData(nickName: "불끈이", plantImgName: "mainImgUser1", selected: false),
            CherishData(nickName: "매끈이", plantImgName: "mainImgUser1", selected: true),
            CherishData(nickName: "훌렁이", plantImgName: "mainImgUser1", selected: false),
            CherishData(nickName: "집착이", plantImgName: "mainImgUser1", selected: true),
            CherishData(nickName: "탐욕이", plantImgName: "mainImgUser1", selected: false), CherishData(nickName: "남쿵둥이", plantImgName: "mainImgUser1", selected: true),
            CherishData(nickName: "홀쭉이", plantImgName: "mainImgUser1", selected: false),
            CherishData(nickName: "불끈이", plantImgName: "mainImgUser1", selected: true),
            CherishData(nickName: "훌렁이", plantImgName: "mainImgUser1", selected: false),
            CherishData(nickName: "집착이", plantImgName: "mainImgUser1", selected: true),
            CherishData(nickName: "탐욕이", plantImgName: "mainImgUser1", selected: false), CherishData(nickName: "남쿵둥이", plantImgName: "mainImgUser1", selected: true),
            CherishData(nickName: "불끈이", plantImgName: "mainImgUser1", selected: false),
            CherishData(nickName: "매끈이", plantImgName: "mainImgUser1", selected: true),
            CherishData(nickName: "훌렁이", plantImgName: "mainImgUser1", selected: false),
            CherishData(nickName: "집착이", plantImgName: "mainImgUser1", selected: true),
            CherishData(nickName: "탐욕이", plantImgName: "mainImgUser1", selected: false), CherishData(nickName: "남쿵둥이", plantImgName: "mainImgUser1", selected: true),
            CherishData(nickName: "불끈이", plantImgName: "mainImgUser1", selected: false),
            CherishData(nickName: "매끈이", plantImgName: "mainImgUser1", selected: true),
            CherishData(nickName: "훌렁이", plantImgName: "mainImgUser1", selected: false),
            CherishData(nickName: "집착이", plantImgName: "mainImgUser1", selected: true),
            CherishData(nickName: "탐욕이", plantImgName: "mainImgUser1", selected: false),
        ])
    }
    

}

extension DetailVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cherishData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCVCell", for: indexPath) as! DetailCVCell
        
        cell.detailCherishNickNameLabel.text = cherishData[indexPath.row].nickName
        cell.detailEclipseImg.isHidden = !cherishData[indexPath.row].selected
        cell.detailGraphicImg.image = UIImage(named: cherishData[indexPath.row].plantImgName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 69, height: 91)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: .isSelect, object: nil)
        
        
    }
    
    
}
