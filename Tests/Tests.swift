//
//  Tests.swift
//  Tests
//
//  Created by AbelHu on 2016/11/14.
//  Copyright © 2016年 qicode. All rights reserved.
//

import XCTest
import Nimble
@testable import ArtSignProSdk

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNextAddition() {
        let additionProblem = nextAdditon()
        expect(additionProblem.leftOperand).to(beLessThanOrEqualTo(20))
        expect(additionProblem.leftOperand).to(beGreaterThan(0))
        expect(additionProblem.rightOperand).to(beLessThanOrEqualTo(20))
        expect(additionProblem.rightOperand).to(beGreaterThan(0))
        expect(additionProblem.op).to(equal(Operator.Add))
    }
    
    func testNextSubtraction() {
        let subtractionProblem = nextSubtraction()
        expect(subtractionProblem.leftOperand).to(beLessThanOrEqualTo(20))
        expect(subtractionProblem.leftOperand).to(beGreaterThan(0))
        expect(subtractionProblem.rightOperand).to(beLessThanOrEqualTo(20))
        expect(subtractionProblem.rightOperand).to(beGreaterThan(0))
        expect(subtractionProblem.op).to(equal(Operator.Minus))
    }
    
    func testNextMultiplction() {
        let multiplicationProblem = nextMultiplication()
        expect(multiplicationProblem.leftOperand).to(beLessThanOrEqualTo(20))
        expect(multiplicationProblem.leftOperand).to(beGreaterThan(0))
        expect(multiplicationProblem.rightOperand).to(beLessThanOrEqualTo(20))
        expect(multiplicationProblem.rightOperand).to(beGreaterThan(0))
        expect(multiplicationProblem.op).to(equal(Operator.Multiply))
    }
    
}
