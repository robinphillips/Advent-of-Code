struct Elf {
    let cleaningSection: Set<Int>
    
    init(range: ClosedRange<Int>) {
        cleaningSection = Set(range)
    }
}
