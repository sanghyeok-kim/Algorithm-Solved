//
//  main.swift
//  프그-42840-모의고사
//
//  Created by 김상혁 on 2022/01/19.
//

//다시 새롭게 풀어본 풀이

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let wayOfOne = [0: 1, 1: 2, 2: 3, 3: 4, 4: 5]
    let wayOfTwo = [0: 2, 1: 1, 2: 2, 3: 3, 4: 2, 5: 4, 6: 2, 7: 5]
    let wayOfThr = [0: 3, 1: 3, 2: 1, 3: 1, 4: 2, 5: 2, 6: 4, 7: 4, 8: 5, 9: 5]
    
    let answersLength = answers.count
    var answerCounts = Array(repeating: 0, count: 3)
    
    for i in 0..<answersLength {
        if answers[i] == wayOfOne[i % wayOfOne.count] ?? -1 { answerCounts[0] += 1 }
        if answers[i] == wayOfTwo[i % wayOfTwo.count] ?? -1 { answerCounts[1] += 1 }
        if answers[i] == wayOfThr[i % wayOfThr.count] ?? -1 { answerCounts[2] += 1 }
    }
    
    let max = answerCounts.max() ?? -1
    let result = answerCounts.indices.filter{ answerCounts[$0] == max }.map{ $0 + 1 }.sorted()
    return result
}
