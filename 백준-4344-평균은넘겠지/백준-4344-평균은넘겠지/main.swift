//
//  main.swift
//  백준-4344-평균은넘겠지
//
//  Created by 김상혁 on 2021/12/05.
//

import Foundation

import Foundation

let count = Int(readLine()!)!

for _ in 0..<count {
    var inputs = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let inputCount = inputs.removeFirst()
    
    let total = inputs.reduce(0, +)
    let aboveCount = inputs.filter{ $0 > total / inputCount }.count
    
    let ratioOfOboveCount = (Double(aboveCount) / Double(inputs.count)) * 100
    print(String(format: "%.3lf%@", ratioOfOboveCount, "%"))
}
