import SwiftUI

struct StartGameView: View {
    @State private var newLife = false
    @State private var showMenu = false
    @State private var loadGame: GameManager? = nil
    
    var body: some View {
        if newLife {
            InsertPlayerName()
        } else if let loadedGame = loadGame {
            ContentView(game: loadedGame)
        } else if showMenu {
            MainMenuView()
        }
        else {
            VStack(spacing: 40) {
                Text("🎮 LifeScript")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button("Start New Life") {
                    newLife = true
                }
                .frame(width: 200)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Load Previous Life") {
                    let loaded = GameManager.loadGame()
                    loadGame = loaded
                }
                .frame(width: 200)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Back") {
                    showMenu = true
                }
                .frame(width: 200)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    StartGameView()
}
