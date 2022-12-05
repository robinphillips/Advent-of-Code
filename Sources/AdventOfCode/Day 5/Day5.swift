struct Day5: Solution {
    static let day = 5
    
    let moves: [[Int]]
    
    init(input: String) {
        moves = input
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
            .compactMap {
                $0.components(separatedBy: " ")
                    .compactMap(Int.init)
            }
        print(moves)
    }
    
    func calculatePartOne() -> Int {
//        print( part1() )
        return 0
    }
    
    func calculatePartTwo() -> Int {
        print( part2() )
        return 0
    }
}

extension Day5 {
    func part1() -> String {
        moves.forEach {
            Supplies.moveCratesPart1(num: $0[0], from: $0[1], to: $0[2])
        }
        
        let topOfStack: [String] = Supplies.supplies.compactMap {
            $0.topOfstack
            
        }
        return topOfStack.joined()
    }
    
    func part2() -> String {
        moves.forEach {
            Supplies.moveCratesPart2(num: $0[0], from: $0[1], to: $0[2])
        }
        
        let topOfStack: [String] = Supplies.supplies.compactMap {
            $0.topOfstack
            
        }
        return topOfStack.joined()
    }
}


struct Supplies {
    static var supplies: [Stack]  = [
        Stack(id: 1, crates: ["B", "S", "V", "Z", "G", "P", "W"]),
        Stack(id: 2, crates: ["J", "V", "B", "C", "Z", "F"]),
        Stack(id: 3, crates: ["V", "L", "M", "H", "N", "Z", "D", "C"]),
        Stack(id: 4, crates: ["L", "D", "M", "Z", "P", "F", "J", "B"]),
        Stack(id: 5, crates: ["V", "F", "C", "G", "J", "B", "Q", "H"]),
        Stack(id: 6, crates: ["G", "F", "Q", "T", "S", "L", "B"]),
        Stack(id: 7, crates: ["L", "G", "C", "Z", "V"]),
        Stack(id: 8, crates: ["N", "L", "G"]),
        Stack(id: 9, crates: ["J", "F", "H", "C"])
    ]
    
    static func moveCratesPart1(num: Int, from: Int, to: Int) {
        for _ in 0 ..< num {
            let crate = supplies[from-1].crates.removeLast()
            supplies[to-1].crates.append(crate)
        }
    }
    
    static func moveCratesPart2(num: Int, from: Int, to: Int) {
        var crates: [String] = []
        for i in 0 ..< num {
            crates.insert(supplies[from-1].crates.removeLast(), at: 0)
        }
        
        supplies[to-1].crates.append(contentsOf: crates)
    }
}
