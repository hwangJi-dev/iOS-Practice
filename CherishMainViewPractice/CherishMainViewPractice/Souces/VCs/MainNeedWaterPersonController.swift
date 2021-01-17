//
//  MainNeedWaterPersonController.swift
//  CherishMainViewPractice
//
//  Created by 황지은 on 2021/01/01.
//

import UIKit

class MainNeedWaterPersonController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    @IBOutlet var handleArea: UIView!
    @IBOutlet var cherishCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleArea.layer.cornerRadius = 20
        handleArea.clipsToBounds = true
        handleArea.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner]
        
        cherishCV.delegate = self
        cherishCV.dataSource = self
        
        self.cherishCV.register(UINib(nibName: "MainNeedWaterPersonCell", bundle: nil), forCellWithReuseIdentifier: "CherishCVCell")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CherishCVCell", for: indexPath) as! CherishCVCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 59, height: 85)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
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
