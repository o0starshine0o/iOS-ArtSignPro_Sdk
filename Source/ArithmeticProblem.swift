//
//  ArithmeticProblem.swift
//  ArtSignProSdk
//
//  Created by AbelHu on 2016/11/14.
//  Copyright © 2016年 qicode. All rights reserved.
//

import Foundation

public enum Operator: String, CustomStringConvertible{
    case Add = "+"
    case Minus = "-"
    case Multiply = "*"
    
    public var description: String{
        get{
            return rawValue
        }
    }
}

public struct ArithmeticProblem: CustomStringConvertible{
    let leftOperand: UInt32
    let op: Operator
    let rightOperand: UInt32
    
    public func answer(with: UInt32) -> Bool{
        switch op {
        case .Add:
            return leftOperand + rightOperand == with
        case .Minus:
            return leftOperand - rightOperand == with
        case .Multiply:
            return leftOperand * rightOperand == with
        }
    }
    
    public var description: String{
        return "\(leftOperand)\(op)\(rightOperand)=?"
    }
}
