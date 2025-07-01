import SwiftUI

struct PauseOverlay: View {
    var onResume: () -> Void
    var onSettings: () -> Void
    var onExit: () -> Void

    var body: some View {
        Color.black.opacity(0.4)
            .ignoresSafeArea()

        VStack(spacing: 20) {
            Text("Paused")
                .font(.title)
                .foregroundColor(.black)

            Button("Resume") {
                onResume()
            }
            .frame(width: 200)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            Button("Save") {
                // Optional: implement here or pass in
            }
            .frame(width: 200)
            .padding()
            .background(Color.yellow)
            .foregroundColor(.white)
            .cornerRadius(10)

            //Need to review how launch settings in game
            //Without going to another page
            
//            Button("Settings") {
//                onSettings()
//            }
//            .frame(width: 200)
//            .padding()
//            .background(Color.orange)
//            .foregroundColor(.white)
//            .cornerRadius(10)

            Button("Exit") {
                onExit()
            }
            .frame(width: 200)
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
#Preview {
    PauseOverlay(onResume: { }, onSettings: { }, onExit: { })
}
