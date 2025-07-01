import SwiftUI

struct SettingsView: View{
    @State private var showMenu = false
    @State private var soundEnabled = true
    
    var body: some View{
        if showMenu {
            MainMenuView()
        } else {
            VStack(spacing: 40) {
                Text("⚙ Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Toggle("Sound Effects", isOn: $soundEnabled)
                    .toggleStyle(SwitchToggleStyle(tint: .green)) // optional color
                    .padding()
                    .frame(width: 200)
                
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
