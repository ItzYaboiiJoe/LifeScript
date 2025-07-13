import SwiftUI

class GameManager: ObservableObject {
    @Published var player: Player
    @Published var log: [String] = []

    init(player: Player) {
        self.player = player
    }

    func ageUp() {
        player.age += 1
        log.append("🎂 \(player.name) turned \(player.age)")
        
        // Random stat effect (basic example)
        let happinessChange = Int.random(in: -5...5)
        let attractivenessChange = Int.random(in: -3...3)
        let knowledgeChange = Int.random(in: -3...3)
        
        player.happiness += happinessChange
        player.attractiveness += attractivenessChange
        player.knowledge += knowledgeChange

        log.append("Happiness: \(player.happiness), Knowledge: \(player.knowledge), Attractiveness: \(player.attractiveness)")
    }
    
    func saveGame() {
        let playerData: [String: Any] = [
            "name": player.name,
            "age": player.age,
            "happiness": player.happiness,
            "knowledge": player.knowledge,
            "attractiveness": player.attractiveness,
            "log": log
        ]

        UserDefaults.standard.set(playerData, forKey: "savedPlayer")
    }
    
    
    static func loadGame() -> GameManager? {
        guard let data = UserDefaults.standard.dictionary(forKey: "savedPlayer"),
              let name = data["name"] as? String,
              let age = data["age"] as? Int,
              let happiness = data["happiness"] as? Int,
              let knowledge = data["knowledge"] as? Int,
              let attractiveness = data["attractiveness"] as? Int,
              let log = data["log"] as? [String]
        else {
            return nil
        }

        let player = Player(name: name, age: age, happiness: happiness, knowledge: knowledge, attractiveness: attractiveness)
        let manager = GameManager(player: player)
        manager.log = log
        return manager
    }
}

