struct Day19: Solution {
    static let day = 19
    
    let state: State
    let blueprints: [Blueprint]
    
    init(input: String) {
        state = State(robots: [.ore: 1], resources: [:])
        blueprints = [
            Blueprint(ore: [.ore: 4], clay: [.ore: 2], obsidian: [.ore: 3, .clay: 14], geode: [.ore: 2, .obsidian: 7]),
            Blueprint(ore: [.ore: 2], clay: [.ore: 3], obsidian: [.ore: 3, .clay: 8], geode: [.ore: 3, .obsidian: 12])
        ]
    }
    
    func calculatePartOne() -> Int {
        blueprints.enumerated().compactMap { (index, blueprint) -> Int? in
            var state = [self.state]
            
            for i in 0..<24 {
                print("Blueprint \(index), Iteration \(i), Count \(state.count)")
                state = state.flatMap { $0.nextState(blueprint: blueprint) }
            }
            
            guard let geodeCount = state
                .compactMap({ $0.resources[.geode] })
                .max() else {
                return nil
            }
            return geodeCount * (index + 1)
        }.reduce(0, +)
    }
    
    func calculatePartTwo() -> Int {
        0
    }
}


struct State: Hashable {
    let robots: [Resource: Int]
    let resources: [Resource: Int]
    
    func nextState(blueprint: Blueprint) -> Set<State> {
        let createdRobots = blueprint.determineCreateableRobots(availableResources: self.resources).map {
            let resources = self.resources
                .merging(robots, uniquingKeysWith: +)
                .merging(blueprint.robotCreation[$0, default: [:]], uniquingKeysWith: -)
            let robots = self.robots.merging([$0: 1], uniquingKeysWith: +)
            return State(robots: robots, resources: resources)
        }
        
        let resources = self.resources.merging(robots, uniquingKeysWith: +)
        let noNewRobots =  State(robots: robots, resources: resources)
        
        return Set(createdRobots + [noNewRobots])
    }
}

struct Blueprint: Hashable {
    let robotCreation: [Resource: [Resource: Int]]
    
    func determineCreateableRobots(availableResources: [Resource: Int]) -> [Resource] {
        Resource.allCases.filter {
            canCreateRobot(ofType: $0, availableResources: availableResources)
        }
    }
    
    func canCreateRobot(ofType resource: Resource, availableResources: [Resource: Int]) -> Bool {
        availableResources
            .merging([.ore: 0, .clay: 0, .obsidian: 0, .geode: 0], uniquingKeysWith: +)
            .merging(robotCreation[resource, default: [:]], uniquingKeysWith: -)
            .allSatisfy { key, value in
                value >= 0
            }
    }
    
    init(ore: [Resource : Int],
         clay: [Resource : Int],
         obsidian: [Resource : Int],
         geode: [Resource : Int]) {
        robotCreation = [
            .ore: ore,
            .clay: clay,
            .obsidian: obsidian,
            .geode: geode
        ]
    }
}

enum Resource: Int, Hashable, CaseIterable {
    case ore, clay, obsidian, geode
}
