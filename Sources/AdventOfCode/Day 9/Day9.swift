struct Day9: Solution {
    static let day = 9
    
//    let instructions: [Move]
    let strings: [String]
    
    init(input: String) {
        strings = input
            .components(separatedBy: .newlines)
            .filter { $0.isNotEmpty}
        
        instructions = strings
            .compactMap(<#T##transform: (String) throws -> ElementOfResult?##(String) throws -> ElementOfResult?#>)
        
        print(strings)
    }
    
    func calculatePartOne() -> Int {
        0
    }
    
    func calculatePartTwo() -> Int {
        0
    }
}

extension Day9 {
    func processMove(instruction: String) -> Move {
        
        let parts = instruction
            .components(separatedBy: .whitespaces)
        
        
        let direction = parts.first
        let distance = parts.last
        
        var move = Move(rawValue: direction)
        
        switch move {
        case .up:
            print("up")
        case .right:
            print("right")
        case .down:
            print("down")
        case .left:
            print("left")
            
        }
    }
    
    func tailPosition(newHeadPos: BridgePoint, prevHeadPos: BridgePoint, tailPos: BridgePoint) -> BridgePoint {
        // if currentHeadPos is more than 1 away from tailPos
        
        guard let distance = checkDistanceBetweenPoints(point1: newHeadPos, point2: tailPos) else { return prevHeadPos }
        print("distance: ", distance)
        if distance > 1 { // function to check for distance
            return prevHeadPos // then return prev head pos
        } else {
            return tailPos
        }
    }
    
    func checkDistanceBetweenPoints(point1: BridgePoint, point2: BridgePoint) -> Int? {
        if abs(point1.x - point2.x) > 1 || abs(point1.y - point2.y) > 1 {
            return 2
        } else if abs(point1.x - point2.x) == 1 && abs(point1.y - point2.y) == 1 {
            return 1
        } else if abs(point1.x - point2.x) == 1 || abs(point1.y - point2.y) == 1 {
            return 1
        } else if abs(point1.x - point2.x) > 2 || abs(point1.y - point2.y) > 2 {
            print("soemthing went wrong, distance is too big")
            return nil
        } else {
            return 0
        }
    }
}

struct BridgePoint: Hashable {
    let x: Int
    let y: Int
}

//enum Move: Int {
//    case up = distance
//    case right = distance
//    case down = distance
//    case left = distance
//
//    init?(rawValue: String, distance: Int) {
//        switch rawValue {
//        case "U":
//            self = .up
//        case "R":
//            self = .right
//        case "D":
//            self = .down
//        case "L":
//            self = .left
//        default:
//            preconditionFailure()
//        }
//    }
//}


