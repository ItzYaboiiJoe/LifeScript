import SwiftUI

struct ContentView: View {
    let playerName: String
    @StateObject private var game: GameManager
    
    @State private var isPaused = false
    @State private var showMenu = false
    @State private var showSettings = false
    @State private var showSaveMessage = false

    init(playerName: String) {
        self.playerName = playerName
        _game = StateObject(wrappedValue: GameManager(
            player: Player(name: playerName, happiness: 80, knowledge: 50, attractiveness: 75)
        ))
    }
    
    init(game: GameManager) {
        self.playerName = game.player.name
        _game = StateObject(wrappedValue: game)
    }
    
    var body: some View {
        if showMenu {
            MainMenuView()
        } else if showSettings {
            SettingsView()
        } else {
            ZStack {
                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        Button(action: {
                            isPaused = true
                        }) {
                            Image(systemName: "gearshape.fill")
                                .padding(10)
                                .clipShape(Circle())
                                .shadow(radius: 3)
                        }
                    }
                    
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
                        .onChange(of: game.log.count) {
                            withAnimation {
                                proxy.scrollTo(game.log.indices.last, anchor: .bottom)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                .blur(radius: isPaused ? 4 : 0)
                
                if isPaused {
                    PauseOverlay(
                        onResume: { isPaused = false },
                        onSettings: { showSettings = true },
                        onExit: { showMenu = true },
                        onSave: {
                            game.saveGame()
                            showSaveMessage = true
                            isPaused = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showSaveMessage = false
                            }
                        }
                    )
                }

                if showSaveMessage {
                    VStack {
                        Text("✅ Game Saved")
                            .padding()
                            .background(Color.black.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.top, 40)
                        Spacer()
                    }
                    .transition(.move(edge: .top))
                    .animation(.easeInOut, value: showSaveMessage)
                }
            }
        }
    }
}

#Preview {
    ContentView(playerName: "")
}
