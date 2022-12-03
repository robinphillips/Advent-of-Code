import XCTest
@testable import AdventOfCode

final class Day3Tests: XCTestCase, SolutionTest {
    typealias SUT = Day3
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.calculatePartOne(), 157)
        
    }
    
    func testPartTwo() throws {
        try XCTAssertEqual(sut.calculatePartTwo(), 0)
    }
}

extension Day3Tests {
    func testRuckSack1() throws {
        let num = 0
        try XCTAssertEqual("vJrwpWtwJgWr", sut.rucksacks[num].compartment1String)
        try XCTAssertEqual("hcsFMMfFFhFp", sut.rucksacks[num].compartment2String)
        try XCTAssertEqual(["p"], sut.rucksacks[num].matchingCharacters)
        try XCTAssertEqual(sut.rucksacks[num].letterPriority?.rawValue, 16)
    }
    
    func testRuckSack2() throws {
        let num = 1
        try XCTAssertEqual("jqHRNqRjqzjGDLGL", sut.rucksacks[num].compartment1String)
        try XCTAssertEqual("rsFMfFZSrLrFZsSL", sut.rucksacks[num].compartment2String)
        try XCTAssertEqual(["L", "L"], sut.rucksacks[num].matchingCharacters)
        try XCTAssertEqual(sut.rucksacks[num].letterPriority?.rawValue, 38)
    }
    
    func testRuckSack3() throws {
        let num = 2
        try XCTAssertEqual("PmmdzqPrV", sut.rucksacks[num].compartment1String)
        try XCTAssertEqual("vPwwTWBwg", sut.rucksacks[num].compartment2String)
        try XCTAssertEqual(["P"], sut.rucksacks[num].matchingCharacters)
        try XCTAssertEqual(sut.rucksacks[num].letterPriority?.rawValue, 42)
    }
    
    func testRuckSack4() throws {
        let rucksack = Rucksack(input: "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn")
        XCTAssertEqual(["v", "v"], rucksack.matchingCharacters)
        XCTAssertEqual(rucksack.letterPriority?.rawValue, 22)
    }
    
    func testRuckSack5() throws {
        let rucksack = Rucksack(input: "ttgJtRGJQctTZtZT")
        XCTAssertEqual(["t", "t"], rucksack.matchingCharacters)
        XCTAssertEqual(rucksack.letterPriority?.rawValue, 20)
    }
    
    func testRuckSack6() throws {
        let rucksack = Rucksack(input: "CrZsJsPPZsGzwwsLwLmpwMDw")
        XCTAssertEqual(["s"], rucksack.matchingCharacters)
        XCTAssertEqual(rucksack.letterPriority?.rawValue, 19)
    }
}
