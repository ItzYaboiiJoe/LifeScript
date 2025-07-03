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

        log.append("Happiness: \(player.happiness), Attractiveness: \(player.attractiveness)")
    }
}

