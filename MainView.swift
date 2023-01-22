import SwiftUI

struct MainView: View {
    @State var history : String = "1 + 1 = 2"
    @State var current : String = "0"
    @State var ans : Float = 0
    @State var ansCalced : Bool = false
    @State var equalsPressed : Bool = false
    @State var allClear : Bool = true
    var body: some View {
        ZStack {
            // Background
            Color.black
                .ignoresSafeArea()
            // Everything else
            VStack {
                // Display last operation and result here
                ZStack {
                    Rectangle()
                        .foregroundColor(.indigo)
                    Text(history)
                        .foregroundColor(.gray)
                        .frame(maxWidth: 1000, alignment: .trailing)
                }
                // Display Number here
                ZStack {
                    Rectangle()
                        .foregroundColor(.indigo)
                    Text(current)
                        .font(.largeTitle)
                        .frame(maxWidth: 1000, alignment: .trailing)
                }
                // Number & operation grid below
                HStack {
                    Button(action: {
                        if (allClear) {
                            current = "0"
                            ans = 0
                        } else {
                            current = "0"
                        }
                    }) {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(.lightGray))
                            if (allClear) {
                                Text("AC")
                                    .foregroundColor(.black)
                            } else {
                                Text("C")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    Button(action: {
                        equalsPressed.toggle()
                    }) {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(.lightGray))
                            Text("±")
                                .foregroundColor(.black)
                                .font(.title)
                        }
                    }
                    Button(action: {
                        // Divide by 100 here
                    }) {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(.lightGray))
                            Text("%")
                                .foregroundColor(.black)
                                .font(.title2)
                        }
                    }
                    SymbolButton(symbol: "÷", current: $current)
                }
                .border(.green)
                HStack {
                    NumberButton(num: 7, allClear: $allClear, current: $current)
                    NumberButton(num: 8, allClear: $allClear, current: $current)
                    NumberButton(num: 9, allClear: $allClear, current: $current)
                    SymbolButton(symbol: "×", current: $current)
                }
                HStack {
                    NumberButton(num: 4, allClear: $allClear, current: $current)
                    NumberButton(num: 5, allClear: $allClear, current: $current)
                    NumberButton(num: 6, allClear: $allClear, current: $current)
                    SymbolButton(symbol: "-", current: $current)
                }
                HStack {
                    NumberButton(num: 1, allClear: $allClear, current: $current)
                    NumberButton(num: 2, allClear: $allClear, current: $current)
                    NumberButton(num: 3, allClear: $allClear, current: $current)
                    SymbolButton(symbol: "+", current: $current)
                }
                HStack {
                    NumberButton(num: 0, allClear: $allClear, current: $current)
                    Button(action: {
                        equalsPressed.toggle()
                    }) {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(.systemGray4))
                            Text(".")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        }
                    }
                    Button(action: {
                        equalsPressed.toggle()
                        ansCalced = true
                        ans = PemdasHandler.pemdasHandler(current)
                        history = current
                        current = String(ans)
                        if (current.suffix(2) == Substring(".0")) {
                            current = String(current.prefix(current.count - 2))
                        }
                        history += "=" + current
                    }) {
                        ZStack {
                            Circle()
                                .foregroundColor(.orange)
                            Text("=")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        }
                    }
                }
                .border(.red)
            }
            .border(.blue)
        }
        .border(.green)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MainView()
        }
    }
}
