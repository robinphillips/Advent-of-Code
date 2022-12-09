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
    
    func test_part2() throws {
        
        // top middle 5
        let tree1 = try sut.trees.first { $0.x == 2 && $0.y == 1 }
        XCTAssertEqual(tree1?.height, 5)
        XCTAssertEqual(tree1?.isVisible, true)
        XCTAssertEqual(tree1?.sceneicScore, 4)
        
        // top middle 5
        let tree2 = try sut.trees.first { $0.x == 2 && $0.y == 3 }
        XCTAssertEqual(tree2?.height, 5)
        XCTAssertEqual(tree2?.isVisible, true)
        XCTAssertEqual(tree2?.sceneicScore, 8)
        
        try XCTAssertEqual(sut.calculateRow(input: [5, 4, 2, 6, 8], treeHeight: 6), 4)
        
        try XCTAssertEqual(sut.calculateRow(input: [3, 3, 3, 2,1,3,2,4,1,3,4,2,5,6,7,8,5,6,7,8], treeHeight: 5), 13)
        
        try XCTAssertEqual(sut.returnTreesTo(edge: .North, x: 2, y: 1), [3])
        try XCTAssertEqual(sut.returnTreesTo(edge: .South, x: 2, y: 1), [3, 5, 3])
        try XCTAssertEqual(sut.returnTreesTo(edge: .East, x: 2, y: 1), [1,2])
        try XCTAssertEqual(sut.returnTreesTo(edge: .West, x: 2, y: 1), [5,2])
        
        try XCTAssertEqual(sut.returnTreesTo(edge: .North, x: 2, y: 3), [3,5,3])
        try XCTAssertEqual(sut.returnTreesTo(edge: .South, x: 2, y: 3), [3])
        try XCTAssertEqual(sut.returnTreesTo(edge: .East, x: 2, y: 3), [4,9])
        try XCTAssertEqual(sut.returnTreesTo(edge: .West, x: 2, y: 3), [3,3])
        
        try XCTAssertEqual(sut.returnTreesTo(edge: .North, x: 4, y: 4), [9,2,2,3])
        try XCTAssertEqual(sut.returnTreesTo(edge: .South, x: 4, y: 4), [])
        try XCTAssertEqual(sut.returnTreesTo(edge: .East, x: 4, y: 4), [])
        try XCTAssertEqual(sut.returnTreesTo(edge: .West, x: 4, y: 4), [9,3,5,3])
        
        try XCTAssertEqual(sut.returnTreesTo(edge: .North, x: 3, y: 3), [3,1,7])
        try XCTAssertEqual(sut.returnTreesTo(edge: .South, x: 3, y: 3), [9])
        try XCTAssertEqual(sut.returnTreesTo(edge: .East, x: 3, y: 3), [9])
        try XCTAssertEqual(sut.returnTreesTo(edge: .West, x: 3, y: 3), [5,3,3])
    }
}
