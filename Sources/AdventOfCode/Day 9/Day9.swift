struct Day9: Solution {
    static let day = 9
    
    let instructions: [(Move, Int)]
    let strings: [(String, String)]
    
    init(input: String) {
        strings = input
            .components(separatedBy: .newlines)
            .filter { $0.isNotEmpty}
            .compactMap {
                let parts = $0.components(separatedBy: .whitespaces)
                return (parts[0], parts[1])
            }
        
        do {
            try instructions = strings
                .compactMap { try processMove(direction: $0.0, distance: $0.1) }
        } catch {
            print( error )
        }
        
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

enum BridgeError: Error {
    case MoveCalcError
}

struct BridgePoint: Hashable {
    let x: Int
    let y: Int
}

enum Move: String {
    case up
    case right
    case down
    case left
    
    

    init?(rawValue: String) {

        switch rawValue {
        case "U":
            self = .up
        case "R":
            self = .right
        case "D":
            self = .down
        case "L":
            self = .left
        default:
            preconditionFailure()
        }
    }
}


