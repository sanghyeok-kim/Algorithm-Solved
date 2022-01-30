//
//  main.swift
//  백준-1158-요세푸스문제
//
//  Created by 김상혁 on 2022/01/30.
//

import Foundation

class CLLNode {
    var index: Int
    var next: CLLNode?
    
    init(data: Int, next: CLLNode? = nil) {
        self.index = data
        self.next = next
    }
}

class CircularLinkedList {
    var tail: CLLNode?
    var size: Int = 0
    
    var resultArray = [Int]()
    
    func isEmpty() -> Bool {
        return tail == nil
    }
    
    func searchPrevNode(targetNodeData: Int) -> CLLNode? {
        var current = tail?.next
        for _ in 0..<size {
            if current?.next?.index == targetNodeData { return current }
            current = current?.next
        }
        return nil
    }
    
    func searchNode(targetNodeData: Int) -> CLLNode? {
        var current = tail
        for _ in 0..<size {
            if current?.next?.index == targetNodeData { return current?.next }
            current = current?.next
        }
        return nil
    }

    func insertAtLast(newNode: CLLNode) {
        if isEmpty() {
            tail = newNode
            newNode.next = newNode
        }
        else {
            newNode.next = tail?.next
            tail?.next = newNode
            tail = newNode //기존 tail이 새로운 tail을 가리킴
        }
        size += 1
    }

    func remove(targetNodeData: Int) { //삭제할 노드가 tail이냐 아니냐가 중요하다
        if isEmpty() { return }
        
        if tail?.index == targetNodeData { //삭제할 노드가 tail이고
            if tail?.next?.index == targetNodeData { //그 노드가 유일한 노드라면(tail.data == targetNodeData == head.data)
                tail = nil
                size -= 1
            }
            else { //삭제할 노드가 tail이지만, 유일한 노드는 아니라면(tail.data == targetNodeData != head.data)
                let prevNode = searchPrevNode(targetNodeData: targetNodeData)
                tail = prevNode
                tail?.next = tail?.next?.next
                size -= 1
            }
        }
        
        else { //삭제할 노드가 tail이 아니라면
            let prevNode = searchPrevNode(targetNodeData: targetNodeData)
            prevNode?.next = prevNode?.next?.next
            size -= 1
        }
    }
    
    func removeByK(startNode: CLLNode?, by K: Int){
        if isEmpty() { return }
        
        var current = startNode
        
        for _ in 0..<K {
            current = current?.next
        }
        
        guard let currentIndex = current?.index else { return }
        
        resultArray.append(currentIndex)
        
        remove(targetNodeData: currentIndex)
        
        removeByK(startNode: current, by: K)
    }
    
    func showAll() {
        if isEmpty() {
            print("|Empty List (tail)|")
            return
        }
        
        var current = tail?.next
        for i in 0..<size - 1 {
            print("|\(current?.index)| →", terminator: " ")
            current = current?.next
        }
        print("|\(current?.index) (tail)|")
    }
}

let input = readLine()!.components(separatedBy: " ")
let N = Int(String((input[0])))!
let K = Int(String((input[1])))!

func solution(_ N: Int, _ K: Int) {
    let CLL = CircularLinkedList()
    
    for i in 1...N{
        let node = CLLNode(data:i)
        CLL.insertAtLast(newNode: node)
    }

    CLL.removeByK(startNode: CLL.tail, by: K)
    var resultStr = CLL.resultArray
    resultStr.map{ String($0) }.joined(separator: ", ")

    var result = "<"
    for i in 0..<resultStr.count {
        if i == resultStr.count - 1 {
            result += String("\(resultStr[i])>")
        }
        else {
            result += String("\(resultStr[i]), ")
        }
    }

    print(result)
}

solution(N, K)
