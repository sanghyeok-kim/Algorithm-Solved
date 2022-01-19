//
//  main.swift
//  프그-42748-K번째수
//
//  Created by 김상혁 on 2022/01/19.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    var result = [Int]()
    
    for i in 0..<commands.count {
        let lowerBound = commands[i][0] - 1
        let upperBound = commands[i][1] - 1
        let trimmedArray = array[lowerBound...upperBound].sorted()
        print(trimmedArray)
        result.append(trimmedArray[commands[i][2] - 1])
    }
    return result
}
