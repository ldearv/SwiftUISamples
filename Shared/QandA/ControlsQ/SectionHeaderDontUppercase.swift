//
//  SectionHeaderDontUppercase.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/19.
//
// 来源：https://developer.apple.com/forums/thread/655524
// 作者：OOPer, workingdogintokyo

import SwiftUI

struct SectionHeaderDontUppercase: View {
    var body: some View {
        List {
            Section {
                Text("默认Section的header会被自动转成大写")
            } header: {
                Text("First Header")
            }
            
            Section {
                Text("对Section增加.textCase(nil),可以禁止被转成大写")
            } header: {
                Text("Second Header")
            }
            .textCase(nil)

            Section {
                Text("把textCase(nil)换成textCase(.none),也是一样的")
            } header: {
                Text("Third Header")
            }
            .textCase(.none)
            
            Section {
                Text("https://developer.apple.com/forums/thread/655524")
            } header: {
                Text("来源")
            }
            
            Section {
                Text("OOPer")
                Text("workingdogintokyo")
            } header: {
                Text("作者")
            }

        }
    }
}

struct SectionHeaderDontUppercase_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderDontUppercase()
    }
}
