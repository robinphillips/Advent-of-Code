struct Day9: Solution {
    static let day = 9
    
    let instructions: [(Move, Int)]
    
    init(input: String) {
        instructions = input
            .components(separatedBy: .newlines)
            .filter { $0.isNotEmpty}
            .compactMap {
                let parts = $0.components(separatedBy: .whitespaces)
                return (parts[0], parts[1])
            }
            .compactMap {
                ( Move(rawValue: $0.0) , Int($0.1) ) as? (Move, Int)
            }
    }
    
    func calculatePartOne() -> Int {
        calculatePointsVisited()
    }
    
    func calculatePartTwo() -> Int {
        0
    }
}

extension Day9 {
    
    func calculatePointsVisited() -> Int {
        var pointsVisitedByTail: [BridgePoint] = [BridgePoint(x: 0, y: 0)]
        var currentHeadPos: BridgePoint = BridgePoint(x: 0, y: 0) {
            didSet {
                let newTailPos = tailPosition(newHeadPos: currentHeadPos, prevHeadPos: oldValue, tailPos: currentTailPos)
                pointsVisitedByTail.append(newTailPos)
            }
        }
        
        var currentTailPos: BridgePoint {
            pointsVisitedByTail.last!
        }
        
        instructions.forEach {
            let direction = $0.0
            let distance = $0.1
            
            let prevX = currentHeadPos.x
            let prevY = currentHeadPos.y
            
            for i in 1 ... distance {
                switch direction {
                case .up:
                    currentHeadPos = BridgePoint(x: prevX, y: prevY+i)
                case .right:
                    currentHeadPos = BridgePoint(x: prevX+i, y: prevY)
                case .down:
                    currentHeadPos = BridgePoint(x: prevX, y: prevY-i)
                case .left:
                    currentHeadPos = BridgePoint(x: prevX-i, y: prevY)
                }
            }
        }
            
        print(Set(pointsVisitedByTail))
        return Set(pointsVisitedByTail).count
        
    }
    
    func tailPosition(newHeadPos: BridgePoint, prevHeadPos: BridgePoint, tailPos: BridgePoint) -> BridgePoint {
        // if currentHeadPos is more than 1 away from tailPos
        
        guard let distance = checkDistanceBetweenPoints(point1: newHeadPos, point2: tailPos) else { return prevHeadPos }
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


