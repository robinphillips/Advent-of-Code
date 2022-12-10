struct Day10: Solution {
    static let day = 10
    
    let commands: [[String]]
    var register: [Int] = [1] {
        didSet {
            print(oldValue)
            print(register)
        }
    }
    
    init(input: String) {
        commands = input
            .components(separatedBy: .newlines)
            .filter { $0.isNotEmpty}
            .compactMap {
                $0.components(separatedBy: .whitespaces)
            }
        
        commands
            .forEach {
                _ = processCommand(command: $0, lastValue: register.last ?? 1)
            }
        
        func processCommand(command: [String], lastValue: Int) -> Int {
            
            if let string = command.last,
                let value = Int(string) {

                register.append(lastValue)
                register.append(lastValue + value)
            } else {
                register.append(lastValue)
            }
            return lastValue
        }
        
        
    }
    
    func calculatePartOne() -> Int {
        calculateSignalStrenghtTotal()
    }
    
    func calculatePartTwo() -> Int {
        0
    }
}

extension Day10 {
    func calculateSignalStrenghtTotal() -> Int {
        let indecies = [20, 60, 100, 140, 180, 220]
        
        return indecies
            .compactMap {
                print("signal strength for \($0): ", calcSigStr($0))
                return calcSigStr($0)
            }
            .reduce(0, +)
    }
    
    func calcSigStr(_ index: Int) -> Int {
        register[index-1] * index
    }
    
}
