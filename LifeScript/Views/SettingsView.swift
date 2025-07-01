import SwiftUI

struct SettingsView: View{
    @State private var showMenu = false
    
    var body: some View{
        if showMenu {
            MainMenuView()
        } else {
            VStack(spacing: 40) {
                Text("⚙ Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Button("Sound Effeects"){
                    //Toggle Effect Later
                }
                
                Spacer()
                
                Button("Back") {
                    showMenu = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    SettingsView()
}
