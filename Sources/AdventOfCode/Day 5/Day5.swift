struct Day5: Solution {
    static let day = 5
    
    let moves: [[Int]]
    var startSupplies: [Stack] = []
    
    init(input: String) {
        moves = input
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
            .compactMap {
                $0.components(separatedBy: " ")
                    .compactMap(Int.init)
            }

        startSupplies = [
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
    }
    
    func calculatePartOne() -> String {
        part1(supplies: startSupplies)
    }
    
    func calculatePartTwo() -> String {
        part2(supplies: startSupplies)
    }
}

extension Day5 {
    func part1(supplies: [Stack]) -> String {
        var tempSupplies = supplies
        
        moves.forEach {
            for _ in 0 ..< $0[0] {
                let crate = tempSupplies[$0[1]-1].crates.removeLast()
                            tempSupplies[$0[2]-1].crates.append(crate)
            }
        }
        
        let topOfStack: [String] = tempSupplies.compactMap {
            $0.topOfstack
        }
        return topOfStack.joined()
    }
    
    func part2(supplies: [Stack]) -> String {
        var tempSupplies = supplies
        
        moves.forEach {
            var crates: [String] = []
            
            for _ in 0 ..< $0[0] {
                crates.insert(tempSupplies[$0[1]-1].crates.removeLast(), at: 0)
            }
            tempSupplies[$0[2]-1].crates.append(contentsOf: crates)
        }
        
        let topOfStack: [String] = tempSupplies.compactMap {
            $0.topOfstack
        }
        return topOfStack.joined()
    }
}

