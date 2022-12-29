//
//  ThreeLibView.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/8.
//

import SwiftUI

struct ThreeLibView: View {
    var body: some View {
        NavigationView {
            
            NavigationLink(destination:TestHandyJSON()) {
                Text("HandyJSON")
            }
        }
    }
}

struct ThreeLibView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeLibView()
    }
}
