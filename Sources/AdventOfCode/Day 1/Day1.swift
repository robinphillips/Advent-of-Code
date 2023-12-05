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
        calcPart2(strings: input)
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
        part2(strings: strings)
    }
    
    func part2(strings: [String]) -> Int {
    
        strings.enumerated().map { index, string in
            processString(string, index: index)
        }
        .reduce(0, +)
    }
    
    func processString(_ string: String, index: Int) -> Int {
            var stringNumber = StringNumber(index: index, originalString: string)
            
            Numbers.allCases.forEach { number in
                if let strRange = string.range(of: number.rawValue, options: .forcedOrdering) {
                    stringNumber.compareBoundingNumber(number.int, index: strRange)
                }
                
                if let strRange = string.range(of: number.rawValue, options: .backwards) {
                    stringNumber.compareBoundingNumber(number.int, index: strRange)
                }
                
                if let numRange = string.range(of: number.int.description, options: .forcedOrdering) {
                    stringNumber.compareBoundingNumber(number.int, index: numRange)
                }
                
                if let numRange = string.range(of: number.int.description, options: .backwards) {
                    stringNumber.compareBoundingNumber(number.int, index: numRange)
                }
            }
            print("stringNumber.index \(stringNumber.index): ", stringNumber.returnString)
            return Int(stringNumber.returnString)!
        }
    
}




extension Day1 {
    
    struct StringNumber: Hashable {
        let index: Int
        let originalString: String
        var left: BoundingNumber?
        var right: BoundingNumber?
        
        var returnString: String {
            guard let left, let right else { return "" }
            return "\(String(describing: left.num))\(String(describing: right.num))"
        }
        
        mutating func compareBoundingNumber(_ num: Int, index: Range<String.Index>) {
            
            if let left {
                if index.lowerBound < left.stringIndex {
                    self.left = BoundingNumber(num: num, stringIndex: index.lowerBound)
                }
            } else {
                self.left = BoundingNumber(num: num, stringIndex: index.lowerBound)
            }
            
            if let right {
                if index.upperBound > right.stringIndex {
                    self.right = BoundingNumber(num: num, stringIndex: index.upperBound)
                }
            } else {
                self.right = BoundingNumber(num: num, stringIndex: index.upperBound)
            }
            
        }
    }
    
    struct BoundingNumber: Hashable {
        let num: Int
        let stringIndex: String.Index
    }
    
    enum Numbers: String, CaseIterable {
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
