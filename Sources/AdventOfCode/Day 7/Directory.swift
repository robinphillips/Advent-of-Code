class Directory {
    let name: String
    var parentDirectory: Directory?
    var subDirectories: [Directory] = []
    var files: [File] = []
    
    var directorySize: Int {
        files.compactMap {
            $0.size
        }.reduce(0, +)
    }
    
    init(name: String, parentDirectory: Directory? = nil, subDirectories: [Directory], files: [File]) {
        self.name = name
        self.parentDirectory = parentDirectory
        self.subDirectories = subDirectories
        self.files = files
    }
}
