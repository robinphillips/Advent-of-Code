import XCTest
@testable import AdventOfCode

final class Day10Tests: XCTestCase, SolutionTest {
    typealias SUT = Day10
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.calculatePartOne(), 13140)
    }
    
    func testPartTwo() throws {
        try XCTAssertEqual(sut.calculatePartTwo(), 0)
    }
}

extension Day10Tests {
    func test_part1() {
        try XCTAssertEqual(sut.calcSigStr(20), 420)
        try XCTAssertEqual(sut.calcSigStr(60), 1140)
        try XCTAssertEqual(sut.calcSigStr(100), 1800)
        try XCTAssertEqual(sut.calcSigStr(140), 2940)
        try XCTAssertEqual(sut.calcSigStr(180), 2880)
        try XCTAssertEqual(sut.calcSigStr(220), 3960)
    }
}
