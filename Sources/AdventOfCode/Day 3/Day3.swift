struct Day3: Solution {
    static let day = 3
    
    var rucksacks: [Rucksack] = []
    var groups: [ElfGroup] = []
    
    init(input: String) {
        rucksacks = input
            .components(separatedBy: .newlines)
            .compactMap {
              return Rucksack(input: $0)
            }
        
        for i in stride(from: 0, to: rucksacks.count-1, by: 3) {
            let elfGroup = ElfGroup(rucksack1: rucksacks[i],
                                    rucksack2: rucksacks[i+1],
                                    rucksack3: rucksacks[i+2])
            groups.append(elfGroup)
        }
    }
    
    func calculatePartOne() -> Int {
        calculateTotalPart1()
    }
    
    func calculatePartTwo() -> Int {
        calculateTotalPart2()
    }
}

extension Day3 {
    func calculateTotalPart1() -> Int {
        rucksacks
            .compactMap {
                $0.letterPriority?.rawValue
            }.reduce(0, +)
    }
    
    func calculateTotalPart2() -> Int {
        groups
            .compactMap {
                $0.letterPriority?.rawValue
            }.reduce(0, +)
    }
}



