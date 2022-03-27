//
//  main.swift
//  백준-17478-재귀함수가뭔가요
//
//  Created by 김상혁 on 2022/03/27.
//

import Foundation

let indentCount = Int(readLine()!)!
let inputCount = indentCount

func makeString(indentCount: Int, string: String) -> String {
    let indent = String(repeating: "_", count: indentCount * 4)
    let content = "\(indent)\(string)"

    return content
}

let 재귀무엇 = "\"재귀함수가 뭔가요?\""
let 잘듣 = "\"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어."
let 마을 = "마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지."
let 답옳 = "그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.\""
let 재귀자신 = "\"재귀함수는 자기 자신을 호출하는 함수라네\""
let 라고할뻔 = "라고 답변하였지."

func recursive(recursionCount: Int) {
    let indentCount = inputCount - recursionCount

    print(makeString(indentCount: indentCount, string: 재귀무엇))

    if recursionCount == 0 {
        print(makeString(indentCount: indentCount, string: 재귀자신))
        print(makeString(indentCount: indentCount, string: 라고할뻔))
        return
    }

    print(makeString(indentCount: indentCount, string: 잘듣))
    print(makeString(indentCount: indentCount, string: 마을))
    print(makeString(indentCount: indentCount, string: 답옳))

    recursive(recursionCount: recursionCount - 1)

    print(makeString(indentCount: indentCount, string: 라고할뻔))
}

print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.")
recursive(recursionCount: indentCount)
