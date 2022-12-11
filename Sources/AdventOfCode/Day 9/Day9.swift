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
        Set(processInstructionsPart(knots: 2)).count
    }
    
    func calculatePartTwo() -> Int {
        Set(processInstructionsPart(knots: 10)).count
    }
}

extension Day9 {
    
    func processInstructionsPart(knots: Int) -> [BridgePoint] {
        var tailPointsVisited: [BridgePoint] = [BridgePoint(x: 0, y: 0)]
        
        var oldRope: [BridgePoint] = []
        var rope: [BridgePoint] = pointBuilder(num: knots) {
            didSet {
                oldRope = oldValue
            }
        }
        
        for i in 0..<instructions.count {
            for _ in 0..<instructions[i].1 {
                let direction = instructions[i].0
                
                switch direction {
                case .up:
                    rope[0].y+=1
                case .right:
                    rope[0].x+=1
                case .down:
                    rope[0].y-=1
                case .left:
                    rope[0].x-=1
                }
                
                for k in 1 ..< rope.count {
                    rope[k] = knotPositionPart(newKnotInFront: rope[k-1], prevKnotInFront: oldRope[k-1], currentPos: rope[k])
                }
                tailPointsVisited.append(rope[knots-1])
            }
        }
        
        return tailPointsVisited
    }
    
    func knotPositionPart(newKnotInFront: BridgePoint, prevKnotInFront: BridgePoint, currentPos: BridgePoint) -> BridgePoint {
          // if currentHeadPos is more than 1 away from tailPos
        
        let dx = newKnotInFront.x - currentPos.x
        let dy = newKnotInFront.y - currentPos.y
        
        var point: BridgePoint = currentPos
        
        if abs(dx) > 1 || abs(dy) > 1 {
            // need to normalise difference to dif 2 to 1 and handle + / -
            point = BridgePoint(x: currentPos.x + min(max(dx, -1), 1),
                                     y: currentPos.y + min(max(dy, -1), 1))
        }
        return point
     }
    
    func pointBuilder(num: Int) -> [BridgePoint] {
        var points: [BridgePoint] = []
        for _ in 0 ..< num {
            points.append(BridgePoint(x: 0, y: 0))
        }
        return points
    }
}

struct BridgePoint: Hashable {
    var x: Int
    var y: Int
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
