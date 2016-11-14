//
//  GenerateProblem.swift
//  ArtSignProSdk
//
//  Created by AbelHu on 2016/11/14.
//  Copyright © 2016年 qicode. All rights reserved.
//

import Foundation

func randomNatureNum(under: UInt32) -> UInt32 {
    return arc4random_uniform(under - 1) + 1
}

public func nextAdditon() -> ArithmeticProblem{
    return ArithmeticProblem(leftOperand: randomNatureNum(under: 20), op: .Add, rightOperand: randomNatureNum(under: 20))
}

public func nextSubtraction() -> ArithmeticProblem{
    return ArithmeticProblem(leftOperand: randomNatureNum(under: 20), op: .Minus, rightOperand: randomNatureNum(under: 20))
}

public func nextMultiplication() -> ArithmeticProblem{
    return ArithmeticProblem(leftOperand: randomNatureNum(under: 20), op: .Multiply, rightOperand: randomNatureNum(under: 20))
}
