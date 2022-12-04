import XCTest
@testable import AdventOfCode

final class Day4Tests: XCTestCase, SolutionTest {
    typealias SUT = Day4
    
    func testPartOne() throws {
        try XCTAssertEqual(sut.calculatePartOne(), 2)
    }
    
    func testPartTwo() throws {
        try XCTAssertEqual(sut.calculatePartTwo(), 4)
    }
}

extension Day4Tests {
    func test_part1_pair1() {
        let num = 0
        try XCTAssertEqual(sut.elfPairs[num].elf1.cleaningSection, Set(2...4))
        try XCTAssertEqual(sut.elfPairs[num].elf2.cleaningSection, Set(6...8))
        try XCTAssertEqual(sut.elfPairs[num].containsFullyOverlapping, false)
    }
    
    func test_part1_pair2() {
        let num = 1
        try XCTAssertEqual(sut.elfPairs[num].elf1.cleaningSection, Set(2...3))
        try XCTAssertEqual(sut.elfPairs[num].elf2.cleaningSection, Set(4...5))
        try XCTAssertEqual(sut.elfPairs[num].containsFullyOverlapping, false)
    }
    
    func test_part1_pair3() {
        let num = 2
        try XCTAssertEqual(sut.elfPairs[num].elf1.cleaningSection, Set(5...7))
        try XCTAssertEqual(sut.elfPairs[num].elf2.cleaningSection, Set(7...9))
        try XCTAssertEqual(sut.elfPairs[num].containsFullyOverlapping, false)
    }
    
    func test_part1_pair4() {
        let num = 3
        try XCTAssertEqual(sut.elfPairs[num].elf1.cleaningSection, Set(2...8))
        try XCTAssertEqual(sut.elfPairs[num].elf2.cleaningSection, Set(3...7))
        try XCTAssertEqual(sut.elfPairs[num].containsFullyOverlapping, true)
    }
    
    func test_part1_pair5() {
        let num = 4
        try XCTAssertEqual(sut.elfPairs[num].elf1.cleaningSection, Set(6...6))
        try XCTAssertEqual(sut.elfPairs[num].elf2.cleaningSection, Set(4...6))
        try XCTAssertEqual(sut.elfPairs[num].containsFullyOverlapping, true)
    }
    
    func test_part1_pair6() {
        let num = 5
        try XCTAssertEqual(sut.elfPairs[num].elf1.cleaningSection, Set(2...6))
        try XCTAssertEqual(sut.elfPairs[num].elf2.cleaningSection, Set(4...8))
        try XCTAssertEqual(sut.elfPairs[num].containsFullyOverlapping, false)
    }
    
    func test_part2_pair3() {
        let num = 2
        try XCTAssertEqual(sut.elfPairs[num].elf1.cleaningSection, Set(5...7))
        try XCTAssertEqual(sut.elfPairs[num].elf2.cleaningSection, Set(7...9))
        try XCTAssertEqual(sut.elfPairs[num].containsFullyOverlapping, false)
        try XCTAssertEqual(sut.elfPairs[num].overlapsAtAll, true)
    }
    
    func test_part2_pair4() {
        let num = 3
        try XCTAssertEqual(sut.elfPairs[num].elf1.cleaningSection, Set(2...8))
        try XCTAssertEqual(sut.elfPairs[num].elf2.cleaningSection, Set(3...7))
        try XCTAssertEqual(sut.elfPairs[num].containsFullyOverlapping, true)
        try XCTAssertEqual(sut.elfPairs[num].overlapsAtAll, true)
    }
    
    func test_part2_pair5() {
        let num = 4
        try XCTAssertEqual(sut.elfPairs[num].elf1.cleaningSection, Set(6...6))
        try XCTAssertEqual(sut.elfPairs[num].elf2.cleaningSection, Set(4...6))
        try XCTAssertEqual(sut.elfPairs[num].containsFullyOverlapping, true)
        try XCTAssertEqual(sut.elfPairs[num].overlapsAtAll, true)
    }
    
    func test_part2_pair6() {
        let num = 5
        try XCTAssertEqual(sut.elfPairs[num].elf1.cleaningSection, Set(2...6))
        try XCTAssertEqual(sut.elfPairs[num].elf2.cleaningSection, Set(4...8))
        try XCTAssertEqual(sut.elfPairs[num].containsFullyOverlapping, false)
        try XCTAssertEqual(sut.elfPairs[num].overlapsAtAll, true)
    }
}
