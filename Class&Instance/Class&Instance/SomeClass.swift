//
//  SomeClass.swift
//  Class&Instance
//
//  Created by 황지은 on 2020/12/08.
//

import Foundation

class SomeClass {
    
    var someProperty : Any = 100
    func someMethod(){
        someProperty = someProperty as! Int + 100
        print("someMethod 호출되었습니다.")
    }
}
