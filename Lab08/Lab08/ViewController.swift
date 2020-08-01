//
//  ViewController.swift
//  Lab08
//
//  Created by 황지은 on 2020/05/17.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
   let size = 4
    var lottoArrays = Array<Array<Int>>()
    var originalNumbers = Array(1 ... 45)
    var index = 0
    var indexNumbers = Array<Int>()
    @IBOutlet var titleLabel: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lottoArrays.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.lottoTableView.dequeueReusableCell(withIdentifier: "LottoCell",for: indexPath)as! LottoCell
        cell.num1.text = "\(lottoArrays[indexPath.row][0])"
        cell.num2.text = "\(lottoArrays[indexPath.row][1])"
        cell.num3.text = "\(lottoArrays[indexPath.row][2])"
        cell.num4.text = "\(lottoArrays[indexPath.row][3])"
        cell.num5.text = "\(lottoArrays[indexPath.row][4])"
        cell.num6.text = "\(lottoArrays[indexPath.row][5])"
        
        return cell
    }
    

    @IBOutlet var lottoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.text = "장미란 고객님"
    }

    @IBAction func doDraw(_ sender: UIBarButtonItem) {
        
        originalNumbers = Array(1...45)
        if lottoArrays.isEmpty == false {
            lottoArrays.removeAll()
        }
        
        for _ in 0...size-1 {
            for _ in 0...5 {
              
                    index = Int(arc4random_uniform(UInt32(originalNumbers.count)))
                                   indexNumbers.append(originalNumbers[index])
                                   originalNumbers.remove(at: index) //중복 방지
                indexNumbers.sort(by: {$0 < $1})
            }
            lottoArrays.append(indexNumbers)
            indexNumbers.removeAll()

        }
        lottoTableView.reloadData()
     
    }
    
}

