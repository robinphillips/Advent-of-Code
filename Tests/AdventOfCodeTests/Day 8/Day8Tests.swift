import XCTest
@testable import AdventOfCode

final class Day8Tests: XCTestCase, SolutionTest {
    typealias SUT = Day8
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.calculatePartOne(), 21)
    }
    
    func testPartTwo() throws {
        try XCTAssertEqual(sut.calculatePartTwo(), 0)
    }
}

extension Day8Tests {
    func test_part1() throws {
        // first 5
        let tree1 = try sut.trees.first { $0.x == 1 && $0.y == 1 }
        XCTAssertEqual(tree1?.height, 5)
        XCTAssertEqual(tree1?.isVisible, true)
        XCTAssertEqual(tree1?.treesToNorth, [0])
        XCTAssertEqual(tree1?.treesToEast, [5,1,2])
        XCTAssertEqual(tree1?.treesToWest, [2])
        XCTAssertEqual(tree1?.treesToSouth, [5,3,5])
        
        // top middle 5
        let tree2 = try sut.trees.first { $0.x == 2 && $0.y == 1 }
        XCTAssertEqual(tree2?.height, 5)
        XCTAssertEqual(tree2?.isVisible, true)
        XCTAssertEqual(tree2?.treesToNorth, [3])
        XCTAssertEqual(tree2?.treesToEast, [1,2])
        XCTAssertEqual(tree2?.treesToWest, [2,5])
        XCTAssertEqual(tree2?.treesToSouth, [3,5,3])
        
        // top right 1
        let tree3 = try sut.trees.first { $0.x == 3 && $0.y == 1 }
        XCTAssertEqual(tree3?.height, 1)
        XCTAssertEqual(tree3?.isVisible, false)
        XCTAssertEqual(tree3?.treesToNorth, [7])
        XCTAssertEqual(tree3?.treesToEast, [2])
        XCTAssertEqual(tree3?.treesToWest, [2,5,5])
        XCTAssertEqual(tree3?.treesToSouth, [3,4,9])
    }
}
