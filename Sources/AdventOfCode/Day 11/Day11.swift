struct Day11: Solution {
    static let day = 11
    
    let monkeys: [Monkey]
    
    init(input: String) {
        monkeys = input
            .components(separatedBy: "\n\n")
            .compactMap { processMonkeyString(input: $0) }
        
        print(monkeys)
        
        func processMonkeyString(input: String) -> Monkey {
            let lines = input
                .components(separatedBy: .newlines)
            
            return Monkey(index: Int(lines[0].split(separator: " ").last!.dropLast(1))!,
                                items: lines[1].split(whereSeparator: { $0.isNumber == false }).map { Int($0)! },
                                operand: Int(lines[2].split(separator: " ").last!),
                                isAdd: lines[2].contains("+"),
                                testDivisor: Int(lines[3].split(separator: " ").last!)!,
                                trueDestMonkey: Int(lines[4].split(separator: " ").last!)!,
                                falseDestMonkey: Int(lines[5].split(separator: " ").last!)!)
        }
    }
    
    func calculatePartOne() -> Int {
        return calculateTotalWorryForMostActive(worryDivisor: 3, rounds: 20)
    }
    
    func calculatePartTwo() -> Int {
        return calculateTotalWorryForMostActive(worryDivisor: 1, rounds: 10_000)
    }
}

extension Day11 {
    func calculateTotalWorryForMostActive(worryDivisor: Int, rounds: Int) -> Int {
        var monkeys = monkeys
        
        let worryReducer = monkeys
            .compactMap {
                $0.testDivisor
            }.reduce(1, *)
        
        for _ in 0 ..< rounds {
            for j in 0 ..< monkeys.count {
                let operand = monkeys[j].operand
                let isAdd = monkeys[j].isAdd
                let divisor = monkeys[j].testDivisor
                let trueDestMonkey = monkeys[j].trueDestMonkey
                let falseDestMonkey = monkeys[j].falseDestMonkey
                
                while monkeys[j].items.isNotEmpty {
                    for _ in 0 ..< monkeys[j].items.count {
                        var item: Int = monkeys[j].items.removeFirst()
                        
                        if let operand {
                            if isAdd {
                                item = item + operand
                            } else {
                                item = item * operand
                            }
                        } else {
                            item = item * item
                        }
                        
                        if worryDivisor > 1 {
                            item = item / worryDivisor
                        } else {
                            item = item % worryReducer
                        }
                        
                        monkeys[j].inspectionCount += 1
                        
                        if item.isMultiple(of: divisor) {
                            monkeys[trueDestMonkey].items.append(item)
                        } else {
                            monkeys[falseDestMonkey].items.append(item)
                        }
                    }
                }
            }
        }
        
        let sortedMonkeys = monkeys
            .sorted {
                $0.inspectionCount > $1.inspectionCount
            }
        
        return sortedMonkeys[0].inspectionCount *
        sortedMonkeys[1].inspectionCount
    }
}

struct Monkey: Hashable {
    let index: Int
    var inspectionCount: Int = 0
    var items: [Int]
    
    var operand: Int?
    
    let isAdd: Bool
    
    let testDivisor: Int
    let trueDestMonkey: Int
    let falseDestMonkey: Int
}
