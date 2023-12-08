import XCTest
@testable import AdventOfCode

final class Day2Tests: XCTestCase, SolutionTest {
    typealias SUT = Day2
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.calculatePartOne(), 8)
    }
    
    func testPartTwo() throws {
        try XCTAssertEqual(sut.calculatePartTwo(), 2286)
    }
}

extension Day2Tests {
    func testSplitString() {
        XCTAssertEqual(try sut.splitString("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")?.maxRed, 4)
        XCTAssertEqual(try sut.splitString("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")?.maxBlue, 6)
    }
}
