import SwiftUI

struct MainMenuView: View {
    @State private var showGame = false
    @State private var showSettings = false

    var body: some View {
        if showGame {
            StartGameView()
        } else if showSettings {
            SettingsView()
        }else {
            VStack(spacing: 40) {
                Text("🎮 LifeScript")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Spacer()

                Button("Start Game") {
                    showGame = true
                }
                .frame(width: 200)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Settings") {
                    showSettings = true
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
    MainMenuView()
}
