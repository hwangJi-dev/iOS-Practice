//
//  LeapYear.swift
//  LeapTestTests
//
//  Created by 황지은 on 2020/04/22.
//  Copyright © 2020 황지은. All rights reserved.
//

import Foundation

class LeapYear{
    func isLeapYear(year:Int) -> Bool {
        var result = false
        
        if year%4 == 0 && (year % 100 != 0 || year % 400 == 0){
            result = true
        }
        return result
    }
}
