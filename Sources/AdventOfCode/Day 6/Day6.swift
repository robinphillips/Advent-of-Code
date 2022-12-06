import Algorithms

struct Day6: Solution {
    static let day = 6
    
    let input: String
    
    init(input: String) {
        self.input = input
    }

    func calculatePartOne() -> Int {
        processSignalSearch(lengthOfStart: 4)
    }
    
    func calculatePartTwo() -> Int {
        processSignalSearch(lengthOfStart: 14)
    }
}

extension Day6 {
    func processSignalSearch(lengthOfStart: Int) -> Int {
        let windowed = input
            .windows(ofCount: lengthOfStart)
            .compactMap(String.init)
        
        let index = windowed
            .firstIndex { string in
                Set(
                    string.compactMap { String($0)}
                ).count == lengthOfStart
            } ?? 0

        return (index + lengthOfStart)
    }
}
