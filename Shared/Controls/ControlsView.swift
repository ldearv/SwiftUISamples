//
//  ControlsView.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/8.
//

import SwiftUI

struct ControlsView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination:TestText()){
                    Text("Text")
                }
                
                NavigationLink(destination:PickerExample()) {
                    Text("Picker")
                }
            }
            .navigationTitle(Text("Controls"))
            //.navigationBarHidden(true)
        }
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
    }
}
