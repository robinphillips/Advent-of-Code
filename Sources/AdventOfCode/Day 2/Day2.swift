struct Day2: Solution {
    static let day = 2
    
    var inputStrings: [[String]] = []
    
    init(input: String) {
        inputStrings = input
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
            .compactMap{
                $0.components(separatedBy: .whitespaces)
            }  
    }

    func calculatePartOne() -> Int {
        calculateTotalPart1()
    }
    
    func calculatePartTwo() -> Int {
        calculateTotalPart2()
    }
}

extension Day2 {
    func calculateTotalPart1() -> Int {
        inputStrings
            .compactMap {
                calculateIndividualScorePart1(first: $0[0], second: $0[1])
            }
            .reduce(0, +)
    }
    
    func calculateTotalPart2() -> Int {
        inputStrings
            .compactMap {
                calculateIndividualScorePart2(first: $0[0], second: $0[1])
            }
            .reduce(0, +)
    }
    
    
    func calculateIndividualScorePart1(first: String, second: String) -> Int {
        
        switch first {
        case "A": // rock
            switch second {
            case "X": // rock -> draw
                return 4
            case "Y": // paper -> win
                return 8
            case "Z": // scissor -> lose
                return 3
            default:
                print("none A")
            }
        case "B": // paper
            switch second {
            case "X": // rock -> lose
                return 1
            case "Y": // paper -> draw
                return 5
            case "Z": // scissor -> win
                return 9
            default:
                print("none B")
            }
        case "C": // scissor
            switch second {
            case "X": // rock -> win
                return 7
            case "Y": // paper -> lose
                return 2
            case "Z": // scissor -> draw
                return 6
            default:
                print("none B")
            }
        default:
            print("none first")
        }
        return 0
    }
    
    func calculateIndividualScorePart2(first: String, second: String) -> Int {
        
        switch first {
        case "A": // rock
            switch second {
            case "X": // lose -> scissor
                return 3 + 0
            case "Y": // draw -> rock
                return 1 + 3
            case "Z": // win -> paper
                return 2 + 6
            default:
                print("none A")
            }
        case "B": // paper
            switch second {
            case "X": // lose -> rock
                return 1 + 0
            case "Y": // draw -> paper
                return 2 + 3
            case "Z": // win -> scissor
                return 3 + 6
            default:
                print("none B")
            }
        case "C": // scissor
            switch second {
            case "X": // lose -> paper
                return 2 + 0
            case "Y": // draw -> scissor
                return 3 + 3
            case "Z": // win -> rock
                return 1 + 6
            default:
                print("none B")
            }
        default:
            print("none first")
        }
        return 0
    }
}
