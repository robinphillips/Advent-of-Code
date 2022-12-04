struct PairOfElves {
    let elf1: Elf
    let elf2: Elf
    
    let fullyOverlapping: Bool
    
    init(elf1: Elf, elf2: Elf) {
        self.elf1 = elf1
        self.elf2 = elf2
        
        if elf1.cleaningSection.isSubset(of: elf2.cleaningSection) ||
            elf2.cleaningSection.isSubset(of: elf1.cleaningSection) {
            fullyOverlapping = true
        } else {
            fullyOverlapping = false
        }
    }
}
