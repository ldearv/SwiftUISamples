//
//  PickerExample.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/15.
//

import SwiftUI

struct PickerExample: View {
    @State var preferSeason = Season.summer
    
    // enum类型需要被迭代时,必须符合CaseIterable协议
    enum Season: String, CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
    
    var body: some View {
        ScrollView {
            
            VStack {
                Text("PickerStyle设置的代码来自：https://zhuanlan.zhihu.com/p/455236230，\n作者：直得点")
                Divider()
                
                HStack {
                    Label("Picker的.pickerStyle为.segment:", systemImage: "1.circle")
                    Spacer()
                }
                .padding()
                
                Picker("喜欢的季节", selection: $preferSeason) {
                    // Season遵循CaseIterable协议后,可使用allCases属性去迭代
                    ForEach(Season.allCases, id: \.self) {season in
                        Text(season.rawValue).tag(season)
                    }
                }
                // 这里是水平展示所有可选项的.segment,
                .pickerStyle(.segmented)
                .padding()
                
                Divider()
                Group {
                    
                    HStack {
                        Label("Picker的.pickerStyle为.menu:", systemImage: "2.circle")
                        Spacer()
                    }
                    .padding()
                    
                    Picker("喜欢的季节", selection: $preferSeason) {
                        // Season遵循CaseIterable协议后,可使用allCases属性去迭代
                        ForEach(Season.allCases, id: \.self) {season in
                            Text(season.rawValue).tag(season)
                        }
                    }
                    // 还有只单一显示被选中项目的.menu,其他备选项不显示
                    .pickerStyle(.menu)
                    .padding(.top,0)
                    
                    Divider()
                    
                    HStack {
                        Label("Picker的.pickerStyle为.inline/.wheel:", systemImage: "3.circle")
                        Spacer()
                    }
                    .padding()
                    
                    Picker("喜欢的季节", selection: $preferSeason) {
                        // Season遵循CaseIterable协议后,可使用allCases属性去迭代
                        ForEach(Season.allCases, id: \.self) {season in
                            Text(season.rawValue).tag(season)
                        }
                    }
                    // 竖式显示所有可选项的.inline和.wheel
                    .pickerStyle(.inline)
                    .padding(.top,0)
                    .padding(.bottom,0)
                    Divider()
                }
                
                Text("下面将两个Picker拼在一起的方法来自https://blog.csdn.net/yaojinhai06/article/details/108528386，\n作者：海阔任月飞，\n作者github地址：https://github.com/gityjh519")
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                twoColumnsPicker
                    .frame(width: UIScreen.main.bounds.width, height: 150, alignment: .center)
            }
        }
    }
    var twoColumnsPicker : some View {
        GeometryReader { (geo: GeometryProxy) in
            HStack (spacing: 0){
                Picker("喜欢的季节", selection: $preferSeason) {
                    ForEach(Season.allCases, id: \.self) {season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: geo.size.width * 0.5, height: geo.size.height, alignment: .center)
                .clipped()
                
                Picker("喜欢的季节", selection: $preferSeason) {
                    ForEach(Season.allCases, id: \.self) {season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: geo.size.width * 0.5, height: geo.size.height, alignment: .center)
                .clipped()
            }
        }
    }
}

struct PickerExample_Previews: PreviewProvider {
    static var previews: some View {
        PickerExample()
    }
}
