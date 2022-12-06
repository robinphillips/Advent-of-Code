import Algorithms

struct Day6: Solution {
    static let day = 6
    
    let signal: [String]
    
    init(input: String) {
        signal = input
            .compactMap { String($0) }
            .filter { $0.isNotEmpty }
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
        let windowed = signal
            .joined()
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
