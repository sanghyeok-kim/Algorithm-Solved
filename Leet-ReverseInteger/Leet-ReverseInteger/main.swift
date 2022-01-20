//
//  main.swift
//  Leet-ReverseInteger
//
//  Created by 김상혁 on 2022/01/12.
//

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        
        let result: Int32 = x < 0 ?
        -(Int32(String(String(abs(x)).reversed())) ?? 0) :
        Int32(String(String(abs(x)).reversed())) ?? 0
        
        return Int(result)
    }
}
