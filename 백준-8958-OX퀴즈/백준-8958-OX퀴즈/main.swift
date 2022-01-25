//
//  main.swift
//  백준-8958-OX퀴즈
//
//  Created by 김상혁 on 2021/12/05.
//

import Foundation

let count = Int(readLine()!)!

func calculateArithmetic(of n: Int) -> Int {
    return n * (2 + ( n - 1 ) * 1) / 2
}

for _ in 0..<count {
    print(readLine()!.split(separator: "X").map{ calculateArithmetic(of: $0.count) }.reduce(0, +))
}



