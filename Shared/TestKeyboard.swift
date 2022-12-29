//
//  TestKeyboard.swift
//  SwiftUISamples (iOS)
//
//  Created by 王猛 on 2022/10/11.
//

import SwiftUI

struct TestKeyboard: View {
    @State var inputText = ""
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack {
                    Group {
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                    }
                    Group {
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                    }
                    Group {
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                        Text("Hello, World!")
                    }
                    TextField("placeholder", text: $inputText)
                    Spacer()
            }
            }
            .navigationTitle(Text("Title"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarUIColor(Color.green)
        }
    }
}

struct TestKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        TestKeyboard()
    }
}
