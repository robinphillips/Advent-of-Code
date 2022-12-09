import XCTest
@testable import AdventOfCode

final class Day9Tests: XCTestCase, SolutionTest {
    typealias SUT = Day9
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.calculatePartOne(), 0)
    }
    
    func testPartTwo() throws {
        try XCTAssertEqual(sut.calculatePartTwo(), 0)
    }
}


extension Day9Tests {
    func test_part1_distanceBetweenPoints() {
        try XCTAssertEqual(sut.checkDistanceBetweenPoints(point1: BridgePoint(x: 0, y: 0), point2: BridgePoint(x: 1, y: 2)), 2)
        
        try XCTAssertEqual(sut.checkDistanceBetweenPoints(point1: BridgePoint(x: 3, y: 1), point2: BridgePoint(x: 1, y: 1)), 2)
    }
    
    func test_part1_tailposition() {
        
        try XCTAssertEqual(sut.tailPosition(newHeadPos: BridgePoint(x: 3, y: 1),
                                            prevHeadPos: BridgePoint(x: 2, y: 1),
                                            tailPos: BridgePoint(x: 1, y: 1)),
                           BridgePoint(x: 2, y: 1))
        
        try XCTAssertEqual(sut.tailPosition(newHeadPos: BridgePoint(x: 1, y: 3),
                                            prevHeadPos: BridgePoint(x: 2, y: 1),
                                            tailPos: BridgePoint(x: 1, y: 1)),
                           BridgePoint(x: 2, y: 1))
        
        try XCTAssertEqual(sut.tailPosition(newHeadPos: BridgePoint(x: 4, y: 2),
                                            prevHeadPos: BridgePoint(x: 4, y: 1),
                                            tailPos: BridgePoint(x: 3, y: 0)),
                           BridgePoint(x: 4, y: 1))
    }
}
