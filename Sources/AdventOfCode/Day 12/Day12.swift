struct Day12: Solution {
    static let day = 12
    
    var grid: [[MapCoordinate]] = []
    var allPoints: Set<MapCoordinate> = []
    
    init(input: String) {
        let result = input
            .components(separatedBy: .newlines)
            .filter { $0.isNotEmpty }
            .map {
                $0.map {
                    Character(extendedGraphemeClusterLiteral: $0)
                }
            }
            
        result
            .enumerated()
            .forEach { rowIndex, row in
                var tempGridRow: [MapCoordinate] = []
                row
                    .enumerated()
                    .forEach { itemIndex, coordinate in
                        let temp = MapCoordinate(x: itemIndex, y: rowIndex, letter: result[rowIndex][itemIndex])
                        tempGridRow.append(temp)
                        allPoints.insert(temp)
                    }
                grid.append(tempGridRow)
            }

    }
    
    func calculatePartOne() -> Int {
        0
    }
    
    func calculatePartTwo() -> Int {
        0
    }
}

extension Day12 {
    func findNeighbours(node: MapCoordinate) -> Set<MapCoordinate> {
        allPoints.filter {
            node.x == $0.x-1 && node.y == $0.y ||
            node.x == $0.x+1 && node.y == $0.y ||
            node.y == $0.y+1 && node.x == $0.x ||
            node.y == $0.y-1 && node.x == $0.x
        }
    }
}

struct MapCoordinate: Hashable {
    let x: Int
    let y: Int

    let letter: Character
    let height: Int
    
    var visited: Bool = false
    var distance: Int? = nil
    
    
//    var accessibleNeighbours: [MapCoordinate] = []
    
    init(x: Int, y: Int, letter: Character) {
        self.x = x
        self.y = y
        self.letter = letter
        
        if letter == "S" {
            self.height = 1
        } else if letter == "E" {
            self.height = 26
        } else {
            self.height = Int(letter.asciiValue!) - 96
        }
    }
}
