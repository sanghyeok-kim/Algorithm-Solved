//
//  main.swift
//  프그-64061-카카오인형뽑기
//
//  Created by 김상혁 on 2022/01/19.
//

import Foundation

struct Stack {
    var elements = [Int]()
    
    mutating func push(element: Int) {
        self.elements.append(element)
    }
    
    mutating func pop() -> Int? {
        if isEmpty() { return nil }
        return self.elements.popLast()
    }
    
    func peek() -> Int? {
        return self.elements.last
    }
    
    func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
}

func pushToys(to machine: inout [Stack], by board: [[Int]]) {
    for i in 0..<board.count {
        for j in 0..<board.count {
            if board[i][j] != 0 { machine[i].push(element: board[i][j]) }
        }
    }
}

func pickToys(from machine: inout [Stack], to basket: inout Stack, by moves: [Int]) -> Int {
    var poppedToyCount = 0

    for item in moves {
        guard let poppedToy = machine[item - 1].pop() else { continue }
        
        if poppedToy == basket.peek() { basket.pop(); poppedToyCount += 2 }
        else { basket.push(element: poppedToy) }
    }
    return poppedToyCount
}

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var machine = Array(repeating: Stack(), count: board.count)
    var basket = Stack()
    
    pushToys(to: &machine, by: board)
    let poppedCount = pickToys(from: &machine, to: &basket, by: moves)

    return poppedCount
}
