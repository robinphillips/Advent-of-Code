import XCTest
@testable import AdventOfCode

final class Day12Tests: XCTestCase, SolutionTest {
    typealias SUT = Day12
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.calculatePartOne(), 0)
    }
    
    func testPartTwo() throws {
        try XCTAssertEqual(sut.calculatePartTwo(), 0)
    }
}

extension Day12Tests {
    func test_coordinateHeights() {
        let test_d = MapCoordinate(x: 5, y: 5, letter: "d")
        XCTAssertEqual(test_d.height, 4)
        
        let test_S = MapCoordinate(x: 5, y: 5, letter: "S")
        XCTAssertEqual(test_S.height, 1)
        
        let test_E = MapCoordinate(x: 5, y: 5, letter: "E")
        XCTAssertEqual(test_E.height, 26)
    }
    
    func test_coordinateHeights_exampleData() {
        try XCTAssertEqual(sut.grid[0][0].height, 1) // S
        try XCTAssertEqual(sut.grid[0][2].height, 2) // b
        try XCTAssertEqual(sut.grid[0][3].height, 17) // q
    }
    
    func test_findNeighbours() {
        try XCTAssertEqual(sut.findNeighbours(node: sut.grid[0][0]),
                           [MapCoordinate(x: 1, y: 0, letter: "a"),
                            MapCoordinate(x: 0, y: 1, letter: "a")
        ])
        
        try XCTAssertEqual(sut.findNeighbours(node: sut.grid[2][2]),
                           [MapCoordinate(x: 1, y: 2, letter: "c"),
                            MapCoordinate(x: 2, y: 1, letter: "c"),
                            MapCoordinate(x: 2, y: 3, letter: "c"),
                            MapCoordinate(x: 3, y: 2, letter: "s")
        ])
    }
}
