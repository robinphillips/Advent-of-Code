import XCTest
@testable import AdventOfCode

final class Day3Tests: XCTestCase, SolutionTest {
    typealias SUT = Day3
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.calculatePartOne(), 157)
        
    }
    
    func testPartTwo() throws {
        try XCTAssertEqual(sut.calculatePartTwo(), 70)
    }
}

extension Day3Tests {
    func test_part2_Group1() throws {
        let num = 0
        try XCTAssertEqual( sut.groups[num].matchingCharacters[0], "r")
        try XCTAssertEqual( sut.groups[num].letterPriority?.rawValue, 18)
    }
    
    func test_part2_Group2() throws {
        let num = 1
        try XCTAssertEqual( sut.groups[num].matchingCharacters[0], "Z")
        try XCTAssertEqual( sut.groups[num].letterPriority?.rawValue, 52)
    }
    
    
    func test_part1_RuckSack1() throws {
        let num = 0
        try XCTAssertEqual("vJrwpWtwJgWr", sut.rucksacks[num].compartment1String)
        try XCTAssertEqual("hcsFMMfFFhFp", sut.rucksacks[num].compartment2String)
        try XCTAssertEqual(["p"], sut.rucksacks[num].matchingCharacters)
        try XCTAssertEqual(sut.rucksacks[num].letterPriority?.rawValue, 16)
    }
    
    func test_part1_RuckSack2() throws {
        let num = 1
        try XCTAssertEqual("jqHRNqRjqzjGDLGL", sut.rucksacks[num].compartment1String)
        try XCTAssertEqual("rsFMfFZSrLrFZsSL", sut.rucksacks[num].compartment2String)
        try XCTAssertEqual(["L", "L"], sut.rucksacks[num].matchingCharacters)
        try XCTAssertEqual(sut.rucksacks[num].letterPriority?.rawValue, 38)
    }
    
    func test_part1_RuckSack3() throws {
        let num = 2
        try XCTAssertEqual("PmmdzqPrV", sut.rucksacks[num].compartment1String)
        try XCTAssertEqual("vPwwTWBwg", sut.rucksacks[num].compartment2String)
        try XCTAssertEqual(["P"], sut.rucksacks[num].matchingCharacters)
        try XCTAssertEqual(sut.rucksacks[num].letterPriority?.rawValue, 42)
    }
    
    func test_part1_RuckSack4() throws {
        let rucksack = Rucksack(input: "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn")
        XCTAssertEqual(["v", "v"], rucksack.matchingCharacters)
        XCTAssertEqual(rucksack.letterPriority?.rawValue, 22)
    }
    
    func test_part1_RuckSack5() throws {
        let rucksack = Rucksack(input: "ttgJtRGJQctTZtZT")
        XCTAssertEqual(["t", "t"], rucksack.matchingCharacters)
        XCTAssertEqual(rucksack.letterPriority?.rawValue, 20)
    }
    
    func test_part1_RuckSack6() throws {
        let rucksack = Rucksack(input: "CrZsJsPPZsGzwwsLwLmpwMDw")
        XCTAssertEqual(["s"], rucksack.matchingCharacters)
        XCTAssertEqual(rucksack.letterPriority?.rawValue, 19)
    }
}
