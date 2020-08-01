//
//  CountWord.swift
//  Lab06
//
//  Created by Digital Media Dept on 03/02/2020.
//  Copyright © 2020 Digital Media Dept. All rights reserved.
//

import Foundation

class CountWord {
    class func convert (words: String) -> [String: Int] {
        var returnValue: [String: Int]! = [String: Int]()
        
         /* CountWord 내용을 생성하는 코드를 작성하세요 */
        for kWord in words.components(separatedBy: " ") {
            let Cword = kWord.lowercased()
            
            if(returnValue.keys.contains(Cword)){
                returnValue [ Cword ]! += 1
            }
            else {
                returnValue [Cword] = 1
            }
           
        }

        return returnValue
    }
}
