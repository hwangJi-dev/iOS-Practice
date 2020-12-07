//
//  ViewController.swift
//  Class&Instance
//
//  Created by 황지은 on 2020/12/08.
//

import UIKit

class ViewController: UIViewController {
    
    let myInstance: SomeClass = SomeClass()
    let methodInstance:MethodProgramming = MethodProgramming()
    //SomeClass라는 이름의 클래스의 이니셜라이저를 호출하여
    //myInstance라는 이름의 상수에 할당
    //클래스의 이니셜라이저를 통해 메모리에 할당되고 초기화한 객체를 우리는 인스턴스라고 부름.

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK - 객체지향형
        myInstance.someProperty = 300
        print(myInstance.someProperty)    
        myInstance.someMethod()
        
        // 함수지향형
        methodInstance.execute(tasks: [methodInstance.doAnotherThing, methodInstance.doSomething])
        
    }
    
   
}

