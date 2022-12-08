struct Day7: Solution {
    static let day = 7
    
    let lines: [String]
    let root: Directory
    
    init(input: String) {
        lines = input
            .components(separatedBy: .newlines)
            .filter { $0.isNotEmpty }
        
        root = Directory(name: "/", subDirectories: [], files: [])
    }
    
    func calculatePartOne() -> Int {
        0
    }
    
    func calculatePartTwo() -> Int {
        0
    }
}

extension Day7 {
    
}
