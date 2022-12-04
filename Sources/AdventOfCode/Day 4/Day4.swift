struct Day4: Solution {
    static let day = 4
    
    let stringRows: [String]
    
    var elfPairs: [PairOfElves] = []
    
    init(input: String) {
        stringRows = input
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
        
        stringRows
            .forEach {
                let row = processStringRow(string: $0)
                let elf1 = Elf(range: row.0 ... row.1)
                let elf2 = Elf(range: row.2 ... row.3)
                
                elfPairs.append(PairOfElves(elf1: elf1, elf2: elf2))
            }
        
        func processStringRow(string: String) -> (Int, Int, Int, Int) {
            
            let ints: [Int] = string
                .components(separatedBy: .punctuationCharacters)
                .compactMap(Int.init)
            
            return (ints[0], ints[1], ints[2], ints[3])
        }
        
        func processOverlappingElves() {
            
        }
    }

    func calculatePartOne() -> Int {
        fullyOverlappingPairs()
    }
    
    func calculatePartTwo() -> Int {
        partiallyOverlappingPairs()
    }
}

extension Day4 {
    func fullyOverlappingPairs() -> Int {
        var count = 0
        elfPairs
            .forEach {
                if $0.containsFullyOverlapping { count += 1 }
            }
        return count
    }
    
    func partiallyOverlappingPairs() -> Int {
        var count = 0
        elfPairs
            .forEach {
                if $0.overlapsAtAll { count += 1 }
            }
        return count
    }
}
