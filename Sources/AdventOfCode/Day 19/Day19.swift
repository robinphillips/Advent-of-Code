import Algorithms

struct Day19: Solution {
    static let day = 19
    
    let state: State
    let blueprints: [Blueprint]
    
    init(input: String) {
        state = State(robots: [.ore: 1], resources: [:])
        blueprints = input
            .components(separatedBy: .newlines)
            .filter { $0.isNotEmpty }
            .map { $0.components(separatedBy: .whitespaces ) }
            .map {
                Blueprint(ore: [.ore: Int($0[6])!], clay: [.ore: Int($0[12])!], obsidian: [.ore: Int($0[18])!, .clay: Int($0[21])!], geode: [.ore: Int($0[27])!, .obsidian: Int($0[30])!])
            }
        
        print(blueprints)
    }
    
    func calculatePartOne() -> Int {
        blueprints.enumerated().compactMap { (index, blueprint) -> Int? in
            var state = [self.state]

            for i in 0..<24 {

                state = state.flatMap { $0.nextState(blueprint: blueprint) }
                    
                let stateSet = Set(state)
                state = Array(stateSet)

                let maxGeode = state
                    .compactMap({ $0.resources[.geode] })
                    .max()
                print("max geode for iteration: \(maxGeode ?? 0)")

                if state.contains(where: { $0.robots[.geode, default: 0] > 0 }) && maxGeode ?? 0 > 2 {
                    state = state.filter {
                        ((maxGeode ?? 0) - $0.resources[.geode, default: 0]) < 2
                    }
                }
                print("Blueprint \(index), Iteration \(i), Count \(state.count)")
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
        var threeBlueprints: [Blueprint] = []
        threeBlueprints.append(blueprints[0])
        threeBlueprints.append(blueprints[1])
        threeBlueprints.append(blueprints[2])
        
        return threeBlueprints.enumerated().compactMap { (index, blueprint) -> Int? in
            var state = [self.state]
            
            for i in 0..<32 {
                
                state = state.flatMap { $0.nextState(blueprint: blueprint) }
                
                let stateSet = Set(state)
                state = Array(stateSet)
                
                let maxGeode = state
                    .compactMap({ $0.resources[.geode] })
                    .max()
                print("max geode for iteration: \(maxGeode ?? 0)")
                
                if state.contains(where: { $0.robots[.geode, default: 0] > 0 }) && maxGeode ?? 0 > 2 {
                    state = state.filter {
                        ((maxGeode ?? 0) - $0.resources[.geode, default: 0]) < 1
                    }
                }
                print("Blueprint \(index), Iteration \(i), Count \(state.count)")
            }
            
            guard let geodeCount = state
                .compactMap({ $0.resources[.geode] })
                .max() else {
                return nil
            }
            return geodeCount
        }.reduce(1, *)
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
