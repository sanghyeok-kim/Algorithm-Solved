//
//  main.swift
//  백준-2444-별찍기7
//
//  Created by 김상혁 on 2021/12/05.
//

import Foundation

let input = Int(readLine()!)!

for i in 0..<input {
    for _ in 0..<(input - i - 1) {
        print(" ", terminator: "")
    }

    for _ in 0..<(i * 2 + 1) {
        print("*", terminator: "")
    }
    print("")
}

for i in 1..<input {
    for _ in 0..<i {
        print(" ", terminator: "")
    }
    
    for _ in 0..<((input - i) * 2 - 1) {
        print("*", terminator: "")
    }
    print("")
}
