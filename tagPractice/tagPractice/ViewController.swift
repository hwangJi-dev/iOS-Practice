//
//  ViewController.swift
//  tagPractice
//
//  Created by 황지은 on 2020/07/14.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet var tagCollectionView: UICollectionView!
    var tagArray:[TagModel] = []
    let myColor : UIColor = UIColor( red: 154/255, green: 154/255, blue:154/255, alpha: 0.1 )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tagCollectionView.delegate = self
        setTag()
      
        
    }
    
    
    func setTag(){
        let tag1 = TagModel(tagName: "전체  ")
        let tag2 = TagModel(tagName: "유제품  ")
        let tag3 = TagModel(tagName: "채소류  ")
        let tag4 = TagModel(tagName: "생선류  ")
        let tag5 = TagModel(tagName: "파우더류  ")
        let tag6 = TagModel(tagName: "과일  ")
        let tag7 = TagModel(tagName: "액체류  ")
        let tag8 = TagModel(tagName: "냉장고를 부탁해  ")
        
        
        tagArray = [tag1,tag2,tag3,tag4,tag5,tag6,tag7,tag8]
        print(tagArray)
        print(tagArray.count)
    }


}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionCell", for: indexPath) as! TagCollectionViewCell
        
        cell.tagNameLabel.text = tagArray[indexPath.row].tagName
       // cell.collectionViewCell.layer.borderWidth = 1
       // cell.collectionViewCell.layer.borderColor = myColor.cgColor
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 15
        
        cell.layer.borderColor = CGColor(srgbRed: 154/255, green: 154/255, blue: 154/255, alpha: 1.0)
        cell.layer.borderWidth = 1
        
        return cell
        
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
