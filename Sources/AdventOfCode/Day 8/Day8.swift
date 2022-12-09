import Algorithms

struct Day8: Solution {
    static let day = 8
    
    let grid: [[Int]]
    
    var trees: [Tree] = []
    
    var trees2: [[Tree2]] = []
    
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
            for item in 0 ..< grid[0].count {
                let tree = Tree(height: grid[row][item], x: item, y: row,
                                treesToNorth: adjacentTreesFor(direction: .North, x: item, y: row),
                                treesToEast: adjacentTreesFor(direction: .East, x: item, y: row),
                                treesToSouth: adjacentTreesFor(direction: .South, x: item, y: row),
                                treesToWest: adjacentTreesFor(direction: .West, x: item, y: row)
                )
                trees.append(tree)
            }
        }
        
        var treeGrid: [[Tree2]] = []
        
        for row in 0 ..< grid.count {
            var tempRow: [Tree2] = []
            for item in 0 ..< grid[0].count {
                let tree = Tree2(height: grid[row][item])
                tempRow.append(tree)
            }
            treeGrid.append(tempRow)
        }
        
        trees2 = treeGrid
        
        calculateScenicScore2()
        
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
        
        func calculateScenicScore2() {
            trees2
                .enumerated()
                .forEach { y, row in
                    row
                        .enumerated()
                        .forEach { x, tree in
                            let toNorth = calculateRow(input: returnTreesTo(edge: .North, x: x, y: y), treeHeight: tree.height)
                            let toEast = calculateRow(input: returnTreesTo(edge: .East, x: x, y: y), treeHeight: tree.height)
                            let toSouth = calculateRow(input: returnTreesTo(edge: .South, x: x, y: y), treeHeight: tree.height)
                            let toWest = calculateRow(input: returnTreesTo(edge: .West, x: x, y: y), treeHeight: tree.height)

                    trees2[y][x].sceneicScore = toNorth * toEast * toSouth * toWest
                }
            }
        }
    }
    
    func calculatePartOne() -> Int {
        calculateTotalVisibleTrees()
    }
    
    func calculatePartTwo() -> Int {
        findHighestScenicScore()
    }
}


extension Day8 {
    func calculateTotalVisibleTrees() -> Int {
        trees
            .filter {
                $0.isVisible
            }.count
    }
    
    func findHighestScenicScore() -> Int {
        
        let result = trees2
            .compactMap {
                $0.compactMap {
                    $0.sceneicScore
                }.max()
            }.max()
        return result ?? 0
    }
    
    func returnTreesTo(edge: Direction, x: Int, y: Int) -> [Int] {
        var tempArray: [Int] = []
        switch edge {
        case .North:
            for i in (0 ..< y).reversed() {
                tempArray.append(grid[i][x])
            }
        case .East:
            for i in (x+1 ..< grid.count) {
                tempArray.append(grid[y][i])
            }
        case .South:
            for i in (y+1 ..< grid[x].count) {
                tempArray.append(grid[i][x])
            }
        case .West:
            for i in (0 ..< x).reversed() {
                tempArray.append(grid[y][i])
            }
        }
        
        return tempArray
    }
    
    func calculateRow(input: [Int], treeHeight: Int) -> Int {
        var returnInt: [Int] = []
        for i in 0 ..< input.count {
            if input[i] < treeHeight {
                returnInt.append(input[i])
            } else if returnInt.count < input.count && treeHeight <= input[i] {
                returnInt.append(input[i])
                break
            } else if input[i] == treeHeight {
                returnInt.append(input[i])
                break
            } else if returnInt.count == input.count {
                break
            }
        }
        return returnInt.count
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
    
    var sceneicScore: Int = 0
    
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

struct Tree2 {
    let height: Int
    var sceneicScore: Int = 0
}

enum Direction {
    case North
    case East
    case South
    case West
}
