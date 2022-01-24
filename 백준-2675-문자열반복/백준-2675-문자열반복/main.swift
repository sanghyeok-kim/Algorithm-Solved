//
//  main.swift
//  백준-2675-문자열반복
//
//  Created by 김상혁 on 2021/12/10.
//

import Foundation

let inputCount = Int(readLine()!)!

for i in 0..<inputCount {
    let iterationCount = readLine()!.map{ Int(String($0)) }
    let str = String(readLine()!)
    var temp: String

    for j in 0..<str.count {
        temp += str
    }
}
