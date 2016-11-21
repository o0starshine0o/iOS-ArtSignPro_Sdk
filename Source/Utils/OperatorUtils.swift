//
//  OperatorUtils.swift
//  SignDesignMaster
//
//  Created by AbelHu on 16/4/22.
//  Copyright © 2016年 Star. All rights reserved.
//

import Foundation

struct RegexHelper {
    let regex: NSRegularExpression
    
    init(pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    func match(input: String) -> Bool {
        let matches = regex.matches(in: input, options: [], range: NSMakeRange(0, input.characters.count))
        return matches.count > 0
    }
}

// 定义运算符（正则运算）
infix operator =~ : DefaultPrecedence

// 封装正则函数
func =~(lhs: String, rhs: String) -> Bool {
    do {
        return try RegexHelper(pattern: rhs).match(input: lhs)
    } catch _ {
        return false
    }
}
