struct ElfGroup {
    let rucksack1: Rucksack
    let rucksack2: Rucksack
    let rucksack3: Rucksack
    
    var matchingCharacters: [String] = []
    var letterPriority: LetterPriority?
    
    
    init(rucksack1: Rucksack, rucksack2: Rucksack, rucksack3: Rucksack, letterPriority: LetterPriority? = nil) {
        self.rucksack1 = rucksack1
        self.rucksack2 = rucksack2
        self.rucksack3 = rucksack3
        self.letterPriority = letterPriority
        
        // compare rucksacks and add to matching character
        matchingCharacters = rucksack1
            .input
            .filter {
                rucksack2.input.contains($0) && rucksack3.input.contains($0)
            }
        
        processPriorities()
        
        func processPriorities() {
            if let string = self.matchingCharacters.first {
                self.letterPriority = LetterPriority(rawValue: string)
            }
        }
    }
}
