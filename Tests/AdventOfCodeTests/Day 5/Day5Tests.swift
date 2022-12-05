import XCTest
@testable import AdventOfCode

final class Day5Tests: XCTestCase, SolutionTest {
    typealias SUT = Day5
    
    var testSupplies: [Stack] = [
        Stack(crates: ["Z", "N"]),
        Stack(crates: ["M", "C", "D"]),
        Stack(crates: ["P"])
    ]
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.part1(supplies: testSupplies), "CMZ")
    }

    func testPartTwo() throws {
        try XCTAssertEqual(sut.part2(supplies: testSupplies), "MCD")
    }
}

extension Day5Tests {
    func test_part1_moves() throws {
        try XCTAssertEqual(sut.moves[0], [1,2,1])
        try XCTAssertEqual(sut.moves[1], [3,1,3])
        try XCTAssertEqual(sut.moves[2], [2,2,1])
        try XCTAssertEqual(sut.moves[3], [1,1,2])
    }
    
    func test_part1_startingCrates() throws {
        XCTAssertEqual(testSupplies[0].crates, ["Z", "N"])
        XCTAssertEqual(testSupplies[1].crates, ["M", "C", "D"])
        XCTAssertEqual(testSupplies[2].crates, ["P"])
    }
}
