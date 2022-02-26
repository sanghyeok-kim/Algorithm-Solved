//
//  main.swift
//  백준-10866-덱
//
//  Created by 김상혁 on 2022/02/26.
//

import Foundation

class Node {
    var data: Int
    var nextNode: Node?
    var prevNode: Node?
    
    init(data: Int, nextNode: Node? = nil, prevNode: Node? = nil) {
        self.data = data
        self.nextNode = nextNode
        self.prevNode = prevNode
    }
}

class Deck {
    var count = 0
    var head: Node?
    var tail: Node?
    
    func isEmpty() -> Bool {
        return (head == nil) && (tail == nil)
    }
    
    func pushFront(newNode: Node) {
        if isEmpty() {
            head = newNode
            tail = newNode
        }
        else {
            let exHead = head
        
            newNode.nextNode = exHead
            exHead?.prevNode = newNode
            head = newNode
        }
        
        count += 1
    }
    
    func pushBack(newNode: Node) {
        if isEmpty() {
            head = newNode
            tail = newNode
        }
        else {
            let exTail = tail
            
            newNode.prevNode = exTail
            exTail?.nextNode = newNode
            tail = newNode
        }
        
        count += 1
    }
    
    func popFront() -> Node? {
        if isEmpty() { //count == 0
            return nil
        }
        
        else if (head?.nextNode == nil && tail?.prevNode == nil) { //count == 1
            let returnHead = head
            head = nil
            tail = nil
            
            count -= 1
            return returnHead
        }
        
        else {
            let exHead = head
            
            head = exHead?.nextNode
            head?.prevNode = nil
            
            count -= 1
            return exHead
        }
    }
    
    func popBack() -> Node? {
        if isEmpty() { //count == 0
            return nil
        }
        
        else if (head?.nextNode == nil && tail?.prevNode == nil) { //count == 1
            let returnTail = head
            head = nil
            tail = nil
            
            count -= 1
            return returnTail
        }
        
        else {
            let exTail = tail
            
            tail = exTail?.prevNode
            tail?.nextNode = nil
            
            count -= 1
            return exTail
        }
    }
    
    func peekFront() -> Node? {
        if isEmpty() {
            return nil
        }
        else {
            return head
        }
    }
    
    func peekBack() -> Node? {
        if isEmpty() {
            return nil
        }
        else {
            return tail
        }
    }
}

func solution() {
    let myDeck = Deck()

    let inputCount = Int(readLine()!)!

    for _ in 0..<inputCount {
        let command = readLine()!.components(separatedBy: " ")
        
        switch command[0] {
            
        case "push_front":
            myDeck.pushFront(newNode: Node(data: Int(command[1])!))
        case "push_back":
            myDeck.pushBack(newNode: Node(data: Int(command[1])!))
            
        case "pop_front":
            let poppedNode = myDeck.popFront()
            poppedNode == nil ? print("-1") : print(poppedNode!.data)
        case "pop_back":
            let poppedNode = myDeck.popBack()
            poppedNode == nil ? print("-1") : print(poppedNode!.data)
            
        case "front":
            let peekNode = myDeck.peekFront()
            peekNode == nil ? print("-1") : print(peekNode!.data)
        case "back":
            let peekNode = myDeck.peekBack()
            peekNode == nil ? print("-1") : print(peekNode!.data)
            
        case "size":
            print(myDeck.count)
        case "empty":
            myDeck.isEmpty() ? print("1") : print("0")
            
        default:
            return
        }
    }
}

solution()
