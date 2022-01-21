//
//  main.swift
//  Leet-RemoveDuplicatesFromSortedList
//
//  Created by 김상혁 on 2022/01/12.
//

import Foundation


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        if head?.val == nil { return nil }
        
        var current = head
        
        while(current?.next != nil) {
            if current?.val == current?.next?.val {
                current?.next = current?.next?.next
            }
            else { current = current?.next }
        }
        return current
    }
}
