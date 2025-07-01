import SwiftUI

struct StartGameView: View {
    @State private var showGame = false
    @State private var showMenu = false
    
    var body: some View {
        if showGame {
            ContentView()
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
                    showGame = true
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Load Previous Life") {
                    // Load Saved Game Logic
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Back") {
                    showMenu = true
                }
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
