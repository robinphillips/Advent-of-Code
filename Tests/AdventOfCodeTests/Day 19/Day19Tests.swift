import XCTest
@testable import AdventOfCode

final class Day19Tests: XCTestCase, SolutionTest {
    typealias SUT = Day19
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.calculatePartOne(), 33)
    }
    
    func testPartTwo() throws {
        try XCTAssertEqual(sut.calculatePartTwo(), 0)
    }
}

extension Day19Tests {
    func test_part1_initialisation() {
        try XCTAssertEqual(sut.state, State(robots: [.ore: 1], resources: [:]))
        
        try XCTAssertEqual(sut.blueprints, [
            Blueprint(ore: [.ore: 4], clay: [.ore: 2], obsidian: [.ore: 3, .clay: 14], geode: [.ore: 2, .obsidian: 7]),
            Blueprint(ore: [.ore: 2], clay: [.ore: 3], obsidian: [.ore: 3, .clay: 8], geode: [.ore: 3, .obsidian: 12])
        ])
    }
    
    func test_nextStateAtTime1() {
        try XCTAssertEqual(sut.state
            .nextState(blueprint: sut.blueprints[0]), [
            State(robots: [.ore: 1], resources: [.ore: 1])
        ])
    }
    
    func test_nextStateAtTime2() {
        try XCTAssertEqual(sut.state
            .nextState(blueprint: sut.blueprints[0])
            .flatMap { try $0.nextState(blueprint: sut.blueprints[0]) }, [
            State(robots: [.ore: 1], resources: [.ore: 2])
        ])
    }
    
    func test_nextStateAtTime3() {
        try XCTAssertEqual(sut.state.nextState(blueprint: sut.blueprints[0])
            .flatMap { try $0.nextState(blueprint: sut.blueprints[0]) }
            .flatMap { try $0.nextState(blueprint: sut.blueprints[0]) }, [
                State(robots: [.ore: 1, .clay: 1], resources: [.ore: 1]),
                State(robots: [.ore: 1], resources: [.ore: 3])
            ])
    }
    
    func test_canCreateRobot() throws {
        let blueprint = try XCTUnwrap(sut.blueprints.first)
        XCTAssertFalse(blueprint.canCreateRobot(ofType: .ore, availableResources: [.ore: 2]))
        XCTAssertFalse(blueprint.canCreateRobot(ofType: .ore, availableResources: [.clay: 5]))
        XCTAssertTrue(blueprint.canCreateRobot(ofType: .ore, availableResources: [.ore: 5]))
        
        XCTAssertFalse(blueprint.canCreateRobot(ofType: .obsidian, availableResources: [.ore: 2, .clay: 13]))
        XCTAssertTrue(blueprint.canCreateRobot(ofType: .obsidian, availableResources: [.ore: 3, .clay: 14]))
        XCTAssertTrue(blueprint.canCreateRobot(ofType: .obsidian, availableResources: [.ore: 4, .clay: 15]))
    }
    
    func test_determineCreateableRobots() throws {
        let blueprint = try XCTUnwrap(sut.blueprints.first)
        XCTAssertEqual(blueprint.determineCreateableRobots(availableResources: [:]),
                       [])
        XCTAssertEqual(blueprint.determineCreateableRobots(availableResources: [.ore: 2, .obsidian: 7]),
                       [.clay, .geode])
        XCTAssertEqual(blueprint.determineCreateableRobots(availableResources: [.ore: 4, .clay: 14, .obsidian: 7]),
                       [.ore, .clay, .obsidian, .geode])
    }
}
