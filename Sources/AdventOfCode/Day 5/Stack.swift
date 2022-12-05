struct Stack {
    let id: Int
    var crates: [String]
    
    var topOfstack: String? {
        return crates.last
    }
    
    func moveCrates(num: Int, from: Int, to: Int) {
        
    }
}
