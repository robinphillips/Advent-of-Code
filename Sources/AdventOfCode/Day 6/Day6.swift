struct Day6: Solution {
    static let day = 6
    
    let signal: [String]
    
    init(input: String) {
        signal = input
            .compactMap { String($0) }
            .filter { !$0.isEmpty }
    }

    func calculatePartOne() -> Int {
        processSignalStart() ?? 0
    }
    
    func calculatePartTwo() -> Int {
        processSignalMessageStart() ?? 0
    }
}


extension Day6 {
    func processSignalStart() -> Int? {
        for i in 0..<signal.count {
            if i < 3 { continue }
            let tempSet: Set<String> = [signal[i],
                                        signal[i-1],
                                        signal[i-2],
                                        signal[i-3]
                                        ]
            if tempSet.count == 4 { return i+1}
        }
        return nil
    }
    
    func processSignalMessageStart() -> Int? {
        for i in 0..<signal.count {
            if i < 13 { continue }
            let tempSet: Set<String> = [signal[i],
                                        signal[i-1],
                                        signal[i-2],
                                        signal[i-3],
                                        signal[i-4],
                                        signal[i-5],
                                        signal[i-6],
                                        signal[i-7],
                                        signal[i-8],
                                        signal[i-9],
                                        signal[i-10],
                                        signal[i-11],
                                        signal[i-12],
                                        signal[i-13]
                                        ]
            if tempSet.count == 14 { return i+1}
        }
        return nil
    }
}
