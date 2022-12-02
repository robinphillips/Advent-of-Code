struct Day1: Solution {
    static let day = 1
    
    var calories: [Int] = []
    
    /// Initialise your solution
    ///
    /// - parameters:
    ///   - input: Contents of the `Day1.input` file within the same folder as this source file
    init(input: String) {
        calories = input
            .components(separatedBy: "\n\n")
            .compactMap {
                $0.components(separatedBy: .newlines)
                    .compactMap(Int.init)
                    
            }
            .compactMap { $0.reduce(0, +) }
            .sorted()
    }

    /// Return your answer to the main activity of the advent calendar
    ///
    /// If you need to, you can change the return type of this method to any type that conforms to `CustomStringConvertible`, i.e. `String`, `Float`, etc.
    func calculatePartOne() -> Int {
        calculateHighestCalories()
    }

    /// Return your solution to the extension activity
    /// _ N.B. This is only unlocked when you have completed part one! _
    func calculatePartTwo() -> Int {
        calculateHighest3()
    }
}

extension Day1 {
    func calculateHighestCalories() -> Int {
        calories.last ?? 0
    }
    
    func calculateHighest3() -> Int {
        let count = calories.count
        
        return calories[count-1]
        + calories[count-2]
        + calories[count-3]
    }
}
