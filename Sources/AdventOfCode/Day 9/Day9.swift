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
        calculatePointsVisited(knots: 2)
    }
    
    func calculatePartTwo() -> Int {
        calculatePointsVisited(knots: 10)
    }
}

extension Day9 {
    
    func calculatePointsVisited(knots: Int) -> Int {
        var rope: [BridgePoint] = []
        
        for _ in 0 ..< knots {
            rope.append(BridgePoint(x: 0, y: 0))
        }
        
        var pointsVisitedByTail: [BridgePoint] = [BridgePoint(x: 0, y: 0)]
    
        
        var currentTailPos: BridgePoint {
            pointsVisitedByTail.last!
        }
        
        instructions.forEach {
            let direction = $0.0
            let distance = $0.1
            
            moveHead(direction: direction, distance: distance)
            
        }

        
        func moveHead(direction: Move, distance: Int) {
            var dist = distance
            let oldHead = rope[0]
            let newHeadPosition: BridgePoint
            
            switch direction {
            case .up:
                newHeadPosition = BridgePoint(x: rope[0].x, y: rope[0].y+1)
            case .right:
                newHeadPosition = BridgePoint(x: rope[0].x+1, y: rope[0].y)
            case .down:
                newHeadPosition = BridgePoint(x: rope[0].x, y: rope[0].y-1)
            case .left:
                newHeadPosition = BridgePoint(x: rope[0].x-1, y: rope[0].y)
            }
            
            rope[0] = newHeadPosition
            
//            let newTailPos = tailPosition(rope: rope, oldHeadPos: oldHead, knots: knots)
            
            rope = moveKnots(rope: rope, oldHeadPos: oldHead)
            
//            rope[knots-1] = newTailPos
            
            pointsVisitedByTail.append(rope[knots-1])
            
            dist -= 1
            
            if dist > 0 {
                moveHead(direction: direction, distance: dist)
            }

        }
        
        return Set(pointsVisitedByTail).count
    }
    
    
    func moveKnots(rope: [BridgePoint], oldHeadPos: BridgePoint) -> [BridgePoint] {
        var tempRope = rope
        for i in 0 ..< rope.count-1 {
            let distance = checkDistanceBetweenPoints(point1: tempRope[i], point2: tempRope[i+1]) ?? 0
            print("iteration i: ", i, distance)
            if distance > 1 && i == 0 {
                tempRope[i+1] = oldHeadPos
            } else if distance > 1 {
               tempRope[i+1] = rope[i]
            }
        }
        return tempRope
    }
    
    
    func tailPosition(rope: [BridgePoint], oldHeadPos: BridgePoint, knots: Int) -> BridgePoint {
        // if currentHeadPos is more than 1 away from tailPos
        guard let distance = checkDistanceBetweenPoints(point1: rope[0], point2: rope[0+1]) else { return oldHeadPos }
        if distance > 1 { // function to check for distance
            return oldHeadPos // then return prev head pos
        } else {
            return rope[knots-1]
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


