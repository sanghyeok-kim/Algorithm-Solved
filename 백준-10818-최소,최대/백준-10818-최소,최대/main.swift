//
//  main.swift
//  백준-10818-최소,최대
//
//  Created by 김상혁 on 2021/12/05.
//

import Foundation

let inputCount = Int(readLine()!)!
let intArr = readLine()!.split(separator: " ").map{ Int(String($0))! }

print("\(intArr.min()!) \(intArr.max()!)")
