struct Stack {
    var crates: [String]
    
    var topOfstack: String? {
        return crates.last
    }
}
