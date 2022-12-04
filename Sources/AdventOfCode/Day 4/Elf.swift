struct Elf {
    let cleaningSection: Set<Int>
    
    var fullyOverlaps = false
    
    init(range: ClosedRange<Int>) {
        cleaningSection = Set(range)
    }
}
