import XCTest
@testable import AdventOfCode

final class Day1Tests: XCTestCase, SolutionTest {
    typealias SUT = Day1
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.calculatePartOne(), 142)
    }
    
    func testPartTwo() throws {
        try XCTAssertEqual(sut.calculatePartTwo(), 281)
    }
}

extension Day1Tests {
    func testRows() {
        XCTAssertEqual(57, try sut.processString("fiveeight5sevenone9twoseven", index: 0))
        XCTAssertEqual(68, try sut.processString("jvvslnkdk6qnfzjzvseight55eight", index: 0))
        XCTAssertEqual(47, try sut.processString("4twoeightgrhhkrvtkrzpfive7seven", index: 0))
        XCTAssertEqual(32, try sut.processString("three8gsmkpzsmfvf2", index: 0))
    }
}
