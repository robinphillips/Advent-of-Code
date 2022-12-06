import Algorithms

struct Day6: Solution {
    static let day = 6
    
    let input: String
    
    init(input: String) {
        self.input = input
    }

    func calculatePartOne() -> Int {
        processSignalSearch(lengthOfStart: 4) ?? 0
    }
    
    func calculatePartTwo() -> Int {
        processSignalSearch(lengthOfStart: 14) ?? 0
    }
}

extension Day6 {
    func processSignalSearch(lengthOfStart: Int) -> Int? {
        let windowed = input
            .windows(ofCount: lengthOfStart)
            .compactMap(String.init)
        
        for i in 0..<windowed.count {
            let tempSet: Set<String> = Set(
                windowed[i].compactMap { String($0)}
            )
            if tempSet.count == lengthOfStart {
                return (i+lengthOfStart)
            }
        }
        return nil
    }
}
