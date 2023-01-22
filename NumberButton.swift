import SwiftUI

struct NumberButton : View {
    let num : Int
    @Binding var allClear : Bool
    @Binding var current : String
    var body: some View {
        HStack {
            Button(action: {
                allClear = false
                if (current != "0") {
                    current += String(num)
                } else {
                    current = String(num)
                }
            }) {
                ZStack {
                    if (num == 0) {
                        Capsule()
                            .foregroundColor(Color(.systemGray4))
                            .frame(maxWidth : 150, maxHeight : 70)
                    } else {
                        Circle()
                            .foregroundColor(Color(.systemGray4))
                    }
                    Text(String(num))
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
            }
        }
    }
}
