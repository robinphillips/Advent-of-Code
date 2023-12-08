struct Day2: Solution {
    static let day = 2
    
    let input: [String]
    
    init(input: String) {
        self.input = input.components(separatedBy: .newlines)
            .filter { $0.isNotEmpty }
    }

    func calculatePartOne() -> Int {
        part1(strings: input)
    }
    
    func calculatePartTwo() -> Int {
        part2(strings: input)
    }
}


extension Day2 {
    func part2(strings: [String]) -> Int {
        let games = strings.map {
            splitString($0)
        }
        
        return games.compactMap {
            $0?.power
        }.reduce(0, +)
    }

    
    func part1(strings: [String]) -> Int {
        let games = strings.map {
            splitString($0)
        }
        
        return games.filter {
            $0?.validGame == true
        }.compactMap {
            $0?.id
        }.reduce(0, +)
    }
    
    func splitString(_ string: String) -> Game? {
        let temp = string.components(separatedBy: ":")
        let game = temp.first?.components(separatedBy: .whitespaces).last
        let hands = temp.last?.components(separatedBy: ";")
        
        let cubes = hands?.flatMap {
            $0.components(separatedBy: ",")
                .filter { $0.isNotEmpty }
        }
            .compactMap {
                Cubes(string: $0)
            }
        
        let red = cubes?.filter { $0.colour == .red } ?? []
        let green = cubes?.filter { $0.colour == .green } ?? []
        let blue = cubes?.filter { $0.colour == .blue } ?? []
        
        guard let game,
        let gameID = Int(game) else { return nil }
        
        let returngGame = Game(id: gameID,
                        red: red,
                        green: green,
                        blue: blue)
        
        return returngGame
    }
    
    struct Game: Hashable {
        let id: Int
        let red: [Cubes]
        let green: [Cubes]
        let blue: [Cubes]
        
        var maxRed: Int {
           red.compactMap {
                $0.number
            }.max() ?? 0
        }
        
        var maxBlue: Int {
           blue.compactMap {
                $0.number
            }.max() ?? 0
        }
        
        var maxGreen: Int {
           green.compactMap {
                $0.number
            }.max() ?? 0
        }
        
        var validGame: Bool {
            if maxRed < 13 && maxGreen < 14 && maxBlue < 15 {
                true
            } else {
                false
            }
        }
        
        var power: Int {
            maxRed * maxGreen * maxBlue
        }
    }
    
    struct Cubes: Hashable {
        let number: Int
        let colour: CubeColour
        
        init?(string: String?) {
            let components = string?.components(separatedBy: .whitespaces).filter {
                $0.isNotEmpty
            }
            
            guard let number = components?.first,
            let int = Int(number) else { return nil }
            guard let colour = components?.last,
            let col = CubeColour(rawValue: colour) else { return nil }
            self.number = int
            self.colour = col
        }
    }
    
    enum CubeColour: String {
        case red, green, blue
    }
}
