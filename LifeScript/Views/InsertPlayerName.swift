import SwiftUI

struct InsertPlayerName: View {
    @State var playerName: String = ""
    @State var startGame = false

    var body: some View {
        if startGame {
            ContentView()
        } else {
            VStack {
                Text("🎮 LifeScript")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)

                Spacer()

                VStack(spacing: 20) {
                    Text("Enter your player Name")
                        .font(.title3)
                        .foregroundColor(.black)

                    TextField("", text: $playerName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 200)

                    Button("Start") {
                        startGame = true
                    }
                    .frame(width: 100)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .frame(width: 300, height: 250)
                .background(Color(.systemGray6))
                .cornerRadius(25)
                .shadow(radius: 10)

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white) // optional
        }
    }
}

#Preview {
    InsertPlayerName()
}
