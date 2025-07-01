import SwiftUI

struct ContentView: View {
    @StateObject private var game = GameManager(
        player: Player(name: "Alex", happiness: 80, knowledge: 50, attractiveness: 75)
    )
    @State private var isPaused = false
    @State private var showMenu = false

    var body: some View {
        if showMenu {
            MainMenuView()
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
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        Text("Paused")
                            .font(.title)
                            .foregroundColor(.black)
                        
                        Button("Resume") {
                            isPaused = false
                        }
                        .frame(width: 70)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        Button("Save") {
                            //Save Logic
                        }
                        .frame(width: 70)
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        Button("Options") {
                            //Options Logic
                        }
                        .frame(width: 70)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        Button("Exit") {
                            showMenu = true
                        }
                        .frame(width: 70)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .frame(width: 300, height: 400)
                    .background(Color(.systemGray6))
                    .cornerRadius(25)
                    .shadow(radius: 10)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
