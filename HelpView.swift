import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack {
            Text("Help Page")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("Help")
    }
}

#Preview {
    HelpView()
}
