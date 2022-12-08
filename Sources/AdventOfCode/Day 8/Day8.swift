import Algorithms

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
        
        calculateScenicScore()
        
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
            
        func calculateScenicScore() {
            trees
                .enumerated()
                .forEach { index, tree in
                    let height = tree.height
//                    var toNorth: [Int] = []
//                    var toEast: [Int] = []
//                    var toSouth: [Int] = []
//                    var toWest: [Int] = []

                
                    let toNorth = calculateRow(input: tree.treesToNorth, treeHeight: tree.height)
                    let toEast = calculateRow(input: tree.treesToEast, treeHeight: tree.height)
                    let toSouth = calculateRow(input: tree.treesToSouth, treeHeight: tree.height)
                    let toWest = calculateRow(input: tree.treesToWest.reversed(), treeHeight: tree.height)

                    print("trees to: \(tree.x) \(tree.y) height: \(tree.height)")
//                    print(toNorth.count, toNorth, tree.treesToNorth)
//                    print(toEast.count, toEast, tree.treesToEast)
//                    print(toSouth.count, toSouth, tree.treesToSouth)
//                    print(toWest.count, toWest, tree.treesToWest)
                    
//                    var tempScenicScore = (toNorth.count * toEast.count * toSouth.count * toWest.count)
                    
//                    trees[index].sceneicScore = tempScenicScore
//                    print(trees[index].sceneicScore, trees[index].x, trees[index].y)
                    trees[index].sceneicScore = toNorth * toEast * toSouth * toWest
                    print("scenic score: ", trees[index].sceneicScore)
                    print("\n")
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
        
        let result = trees
            .compactMap {
                $0.sceneicScore
            }
            .sorted()
        
        print(result)
        
        return result.max() ?? 0
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

enum Direction {
    case North
    case East
    case South
    case West
}




//                    var toNorth: [Int] = tree.treesToNorth
//                        .prefix { $0 < height }
//                        .compactMap(Int.init)
//                    var toEast: [Int] = tree.treesToEast
//                        .prefix { $0 < height }
//                        .compactMap(Int.init)
//                    var toSouth: [Int] = tree.treesToSouth.reversed()
//                        .prefix { $0 < height}
//                        .compactMap(Int.init)
//                    var toWest: [Int] = tree.treesToWest.reversed()
//                        .prefix { $0 < height }
//                        .compactMap(Int.init)

                    
                    
//
//                    let combined = toNorth + toEast + toSouth + toWest
//                    print("combined: ", combined)
                    
                    
                    
//                    if toNorth.count == tree.treesToNorth.count ||
//                        toEast.count == tree.treesToEast.count ||
//                        toSouth.count == tree.treesToSouth.count ||
//                        toWest.count == tree.treesToWest.count
//                    {
//                        tempScenicScore += 1
//                    }
                    
//                    if toNorth.count < tree.treesToNorth.count {
//                        toNorth.append(tree.height)
//                    }
//
//                    if toEast.count < tree.treesToEast.count {
//                        toEast.append(tree.height)
//                    }
//
//                    if toSouth.count < tree.treesToSouth.count {
//                        toSouth.append(tree.height)
//                    }
//
//                    if toWest.count < tree.treesToWest.count {
//                        toWest.append(tree.height)
//                    }


//    func calculatedIdeaSpot() -> Int {
//        var scenicScore = calculatedIdeaSpot() {
//            didSet {
//                if oldValue > scenicScore {
//                    scenicScore = oldValue
//                }
//            }
//        }
//
//        trees
//            .enumerated()
//            .forEach { index, tree in
//                let height = tree.height
//                let toNorth: [Int] = tree.treesToNorth
//                    .prefix { $0 < height }
//                let toEast: [Int] = tree.treesToEast
//                    .prefix { $0 < height }
//                let toSouth: [Int] = tree.treesToSouth
//                    .prefix { $0 < height }
//                let toWest: [Int] = tree.treesToWest
//                    .prefix { $0 < height }
//
//                let combined = toNorth + toEast + toSouth + toWest
//
//                scenicScore = combined
//                    .reduce(0, *)
////                    .reduce(0) { partialResult, int in
////                        partialResult * int
////                    }
//                if index == trees.count {
//                    return scenicScore
//                }
//            }
//
//        break
//    }
