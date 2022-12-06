import XCTest
@testable import AdventOfCode

final class Day6Tests: XCTestCase, SolutionTest {
    typealias SUT = Day6
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.calculatePartOne(), 5)
    }
    
    func testPartTwo() throws {
        try XCTAssertEqual(sut.calculatePartTwo(), 23)
    }
}
