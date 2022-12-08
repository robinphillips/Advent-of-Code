struct Day8: Solution {
    static let day = 8
    
    let grid: [[Int]]
    
    var trees: [Tree] = []
    
    init(input: String) {
        grid = input
            .components(separatedBy: .newlines)
            .filter { $0.isNotEmpty }
            .compactMap {
                $0.compactMap {
                    Int(String($0))
                }
            }
        
        for row in 0 ..< grid.count {
//            print("\nrow: ", row)
            for item in 0 ..< grid[0].count {
//                print("\nitem: ", item)
//                print(grid[row][item])
                let tree = Tree(height: grid[row][item], x: item, y: row,
                                treesToNorth: adjacentTreesFor(direction: .North, x: item, y: row),
                                treesToEast: adjacentTreesFor(direction: .East, x: item, y: row),
                                treesToSouth: adjacentTreesFor(direction: .South, x: item, y: row),
                                treesToWest: adjacentTreesFor(direction: .West, x: item, y: row)
                )
                trees.append(tree)
            }
        }
        
        func adjacentTreesFor(direction: Direction, x: Int, y: Int) -> [Int] {
            var tempTrees: [Int] = []
            
            switch direction {
            case .North:
                grid
                    .enumerated()
                    .forEach { index, row in
                        if index < y {
                            tempTrees.append(row[x])
                        }
                    }
                
            case .East:
                grid[y]
                    .enumerated()
                    .forEach { index, item in
                        if index > x {
                            tempTrees.append(item)
                        }
                    }
            case .South:
                grid
                    .enumerated()
                    .forEach { index, row in
                        if index > y {
                            tempTrees.append(row[x])
                        }
                    }
            case .West:
                grid[y]
                    .enumerated()
                    .forEach { index, item in
                        if index < x {
                            tempTrees.append(item)
                        }
                    }
            }
            
            return tempTrees
        }
    }
    
    func calculatePartOne() -> Int {
        calculateTotalVisibleTrees()
    }
    
    func calculatePartTwo() -> Int {
        0
    }
}


extension Day8 {
    func calculateTotalVisibleTrees() -> Int {
        trees
            .filter {
                $0.isVisible
            }.count
    }
}

struct Tree {
    let height: Int
    let x: Int
    let y: Int
    
    let treesToNorth: [Int]
    let treesToEast: [Int]
    let treesToSouth: [Int]
    let treesToWest: [Int]
    
    var isVisible: Bool {
        if treesToNorth.isEmpty || treesToEast.isEmpty || treesToSouth.isEmpty || treesToWest.isEmpty {
            return true
        } else if height <= treesToNorth.max() ?? 0 &&
                    height <= treesToEast.max() ?? 0 &&
                    height <= treesToSouth.max() ?? 0 &&
                    height <= treesToWest.max() ?? 0 {
            return false
        }
        return true
    }
}

enum Direction {
    case North
    case East
    case South
    case West
}
