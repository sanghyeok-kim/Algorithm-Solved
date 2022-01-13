//
//  main.swift
//  Leet-TwoSum
//
//  Created by 김상혁 on 2022/01/12.
//

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numToIndex = [Int:Int]()  //[배열의 원소(key) : 원소의 인덱스(value)]
                                       //어느 원소가 몇 번 인덱스에 있는지를 알려주는 역할

        //예) target = 10일 때,
        //3의 위치를 찾아야 함 -> 3을 key로 넣으면 3의 인덱스 번호를 value로 반환받을 수 있음
        for nowIndex in 0..<nums.count {
            if let idxToFind = numToIndex[target - nums[nowIndex]] {
                //찾으려는 수의 인덱스 = (target - 현재 수)를 key로 넣은 value값
                //key에 맞는 value를 찾을 수 없으면 nil이 반환되므로 조건문이 실행되지 않음

                print("\(idxToFind), \(nowIndex)")
                //key에 맞는 value(찾으려는 수의 인덱스)를 찾았다면,
                //(찾으려는 수의 인덱스, 현재 수의 인덱스)를 반환
                return [idxToFind, nowIndex]
            }
            else {
                numToIndex[nums[nowIndex]] = nowIndex
                //[key : 현재 정수 값, value : 현재 원소의 인덱스] pair를 dict에 저장
            }
        }
        return []
    }
}

let s = Solution()
print(s.twoSum([1, 2, 4, 6, 7], 10))

