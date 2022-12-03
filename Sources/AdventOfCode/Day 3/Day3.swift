struct Day3: Solution {
    static let day = 3
    
    var rucksacks: [Rucksack] = []
    
    init(input: String) {
        rucksacks = input
            .components(separatedBy: .newlines)
            .compactMap {
              return Rucksack(input: $0)
            }
    }
    
    func calculatePartOne() -> Int {
        calculateTotalPart1()
    }
    
    func calculatePartTwo() -> Int {
        0
    }
}

extension Day3 {
    func calculateTotalPart1() -> Int {
        rucksacks
            .compactMap {
                $0.letterPriority?.rawValue
            }.reduce(0, +)
    }
}

struct Rucksack {
    let compartment1String: String
    let compartment1Sorted: [String]
    
    let compartment2String: String
    let compartment2Sorted: [String]
    
    var matchingCharacters: [String] = []
    
    var letterPriority: LetterPriority?
    
    init(input: String) {
        var tempInput = input
        let halfLength = tempInput.count / 2
        let index = tempInput.index(input.startIndex, offsetBy: halfLength)
        tempInput.insert(" ", at: index)
        let compartments = tempInput.components(separatedBy: " ")
        compartment1String = compartments[0]
        compartment1Sorted = compartments[0]
            .compactMap{
                String($0)
            }.sorted()
        
        compartment2String = compartments[1]
        compartment2Sorted = compartments[1]
            .compactMap{
                String($0)
            }.sorted()
        
        var tempComp2 = compartment2Sorted
        
        compartment1Sorted
            .forEach { character1 in
                    tempComp2
                    .forEach { character2 in
                        if character1 == character2 {
                            matchingCharacters.append(character2)
                            guard let index = tempComp2.firstIndex(of: character2) else { return }
                            tempComp2.remove(at: index)
                        }
                    }
                
            }
        
        processPriorities()
        
        func processPriorities() {
            if let string = self.matchingCharacters.first {
                self.letterPriority = LetterPriority(rawValue: string)
            }
        }
    }
}

