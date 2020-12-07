//
//  MethodProgramming.swift
//  Class&Instance
//
//  Created by 황지은 on 2020/12/08.
//

import Foundation

class MethodProgramming {
    func doSomething(){
        print("do something")
    }
    
    func doAnotherThing(){
        print("do another thing")
    }
    
    func execute(tasks:[() -> Void]){
        for task in tasks {
            task()
        }
    }
    
}
