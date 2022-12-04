struct PairOfElves {
    var elf1: Elf
    var elf2: Elf
    
    let containsFullyOverlapping: Bool
    let overlapsAtAll: Bool
    
    init(elf1: Elf, elf2: Elf) {
        self.elf1 = elf1
        self.elf2 = elf2
        
        if elf1.cleaningSection.isSubset(of: elf2.cleaningSection) {
            containsFullyOverlapping = true
            self.elf1.fullyOverlaps = true
        } else if elf2.cleaningSection.isSubset(of: elf1.cleaningSection) {
            containsFullyOverlapping = true
            self.elf2.fullyOverlaps = true
        } else {
            containsFullyOverlapping = false
        }
        
        if elf1.cleaningSection.intersection(elf2.cleaningSection).isEmpty {
            overlapsAtAll = false
        } else {
            overlapsAtAll = true
        }
    }
}
