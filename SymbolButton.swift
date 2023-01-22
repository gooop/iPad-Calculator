import SwiftUI

struct SymbolButton : View {
    let symbol : String
    @Binding var current : String
    var body: some View {
        Button(action: {
            if (current.last != "÷" && current.last != "×" && current.last != "-" && current.last != "+") {
                current += symbol
            } else {
                current = String(current.prefix(current.count - 1))
                current += symbol
            }
        }) {
            ZStack {
                Circle()
                    .foregroundColor(.orange)
                Text(symbol)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
        }
    }
}
