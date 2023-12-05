struct Day1: Solution {
    static let day = 1
    
    let input: [String]
    
    /// Initialise your solution
    ///
    /// - parameters:
    ///   - input: Contents of the `Day1.input` file within the same folder as this source file
    init(input: String) {
        self.input = input.components(separatedBy: .whitespacesAndNewlines)
            .filter { $0.isNotEmpty }
    }

    /// Return your answer to the main activity of the advent calendar
    ///
    /// If you need to, you can change the return type of this method to any type that conforms to `CustomStringConvertible`, i.e. `String`, `Float`, etc.
    func calculatePartOne() -> Int {
        calcPart1(strings: input)
    }

    /// Return your solution to the extension activity
    /// _ N.B. This is only unlocked when you have completed part one! _
    func calculatePartTwo() -> Int {
        calcPart2(strings: <#T##[String]#>)
    }
}

extension Day1 {
    func calcPart1(strings: [String]) -> Int {
        let temp = strings.map {
            $0.filter {
                Int(String($0)) != nil
            }
        }
            .compactMap { string in
                let first = String(string.first!)
                let last = String(string.last!)
                return Int( String(first + last) )
            }
        return temp.reduce(0, +)
    }
    
    func calcPart2(strings: [String]) -> Int {
        0
    }
}


extension Day1 {
    enum Numbers: String {
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        
        var int: Int {
            switch self {
            case .one:
                1
            case .two:
                2
            case .three:
                3
            case .four:
                4
            case .five:
                5
            case .six:
                6
            case .seven:
                7
            case .eight:
                8
            case .nine:
                9
            }
        }
    }
}
