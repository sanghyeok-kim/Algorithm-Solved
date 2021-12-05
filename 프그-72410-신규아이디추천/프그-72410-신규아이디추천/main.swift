//
//  main.swift
//  프그-72410-신규아이디추천
//
//  Created by 김상혁 on 2021/12/05.
//

import Foundation

func solution(_ new_id:String) -> String {
    var result: String
    
    //step1
    let afterStep1 = new_id.lowercased()
    result = afterStep1
    
    //step2
    let afterStep2 = afterStep1.filter { $0.isLowercase || $0.isNumber || $0 == "-" || $0 == "_" || $0 == "."}
    result = afterStep2
    
    //step3
    while(result.contains("..")) {
        result = result.replacingOccurrences(of: "..", with: ".")
    }
    
    //step4
    result = result.trimmingCharacters(in: CharacterSet(charactersIn: "."))
    
    //step5
    if result.count == 0 {
        result = "a"
    }
    
    //step6
    if result.count > 15 {
        result = String(result.prefix(15))
        
        if result.hasSuffix(".") {
            result = String(result.dropLast())
        }
    }
    
    //step7
    if result.count < 3 {
        while result.count != 3 {
            result.append(result.last!)
        }
    }
    return result
}


