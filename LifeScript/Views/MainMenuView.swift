import SwiftUI

struct MainMenuView: View {
    @State private var showGame = false
    @State private var showSettings = false

    var body: some View {
        if showGame {
            ContentView()
        } else if showSettings {
            SettingsView()
        } else {
            VStack(spacing: 40) {
                Text("🎮 LifeScript")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Button("Start Game") {
                    showGame = true
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Settings") {
                    showSettings = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Quit"){
                    //Quit Logic Later
                }
                .padding()
                .background(Color.red)
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
