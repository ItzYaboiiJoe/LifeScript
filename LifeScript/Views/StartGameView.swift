import SwiftUI

struct StartGameView: View {
    @State private var newLife = false
    @State private var showMenu = false
    
    var body: some View {
        if newLife {
            InsertPlayerName()
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
