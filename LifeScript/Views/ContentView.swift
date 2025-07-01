import SwiftUI

struct ContentView: View {
    @StateObject private var game = GameManager(
        player: Player(name: "Alex", happiness: 80, knowledge: 50, attractiveness: 75)
    )

    var body: some View {
        VStack(spacing: 20) {
            Text("👤 Name: \(game.player.name)")
            Text("🎂 Age: \(game.player.age)")
            Text("😊 Happiness: \(game.player.happiness)")
            Text("📚 Knowledge: \(game.player.knowledge)")
            Text("💅 Attractiveness: \(game.player.attractiveness)")

            Button("Age Up") {
                game.ageUp()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            Divider()

            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(game.log.indices, id: \.self) { i in
                            Text("• \(game.log[i])")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .id(i)
                        }
                    }
                }
                .onChange(of: game.log.count) { _, _ in
                    withAnimation {
                        proxy.scrollTo(game.log.indices.last, anchor: .bottom)
                    }
                }

            }


            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
