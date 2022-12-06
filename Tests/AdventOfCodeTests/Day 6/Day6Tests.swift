import XCTest
@testable import AdventOfCode

final class Day6Tests: XCTestCase, SolutionTest {
    typealias SUT = Day6
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.calculatePartOne(), 0)
    }
    
    func testPartTwo() throws {
        try XCTAssertEqual(sut.calculatePartTwo(), 0)
    }
}

extension Day6Tests {
    func test_part1() throws {
        try XCTAssertEqual(sut.processSignalSearch(lengthOfStart: 4), 5)
    }
    
    func test_part2() throws {
        try XCTAssertEqual(sut.processSignalSearch(lengthOfStart: 14), 23)
    }
}
