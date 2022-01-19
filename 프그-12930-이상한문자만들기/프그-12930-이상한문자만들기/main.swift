//
//  main.swift
//  프그-12930-이상한문자만들기
//
//  Created by 김상혁 on 2022/01/19.
//

import Foundation

func solution(_ s:String) -> String {
    
    return s.components(separatedBy: " ")
        .map{ $0.enumerated().map{ $0.0 % 2 == 0 ? $0.1.uppercased() : $0.1.lowercased() } }
        .map{ $0.joined(separator: "") }
        .joined(separator: " ")
}

