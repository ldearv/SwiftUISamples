//
//  TestText.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/15.
//

import SwiftUI

struct TestText: View {
    var body: some View {
        List {
            Section(content: {
                Group {
                    Text("系统预设 Large title : 34")
                        .font(.largeTitle)
                    Text("系统预设 title : 28")
                        .font(.title)
                    Text("系统预设 title2 : 22")
                        .font(.title2)
                    Text("系统预设 title3 : 20")
                        .font(.title3)
                    Text("系统预设 headline : 17 : Semibold")
                        .font(.headline)
                    HStack {
                        Text("系统预设 body : 17")
                            .font(.body)
                        Text("(default)")
                    }
                    Text("系统预设 callout : 16")
                        .font(.callout)
                    Text("系统预设 subheadline : 15")
                        .font(.subheadline)
                    Text("系统预设 footnote : 13")
                        .font(.footnote)
                    Text("系统预设 caption : 12")
                        .font(.caption)
                }
                Text("系统预设 caption2 : 11")
                    .font(.caption2)
            }
                    ,header:{Text("字号（Large (Default)）Weight:Regular")
            })
            .textCase(nil)
            
            Section(header: Text("Font")) {
                ForEach(11..<37, id: \.self) { size in
                    Text("字号 Font.system(size: \(size))")
                        .font(Font.system(size: CGFloat(size)))
                }
            }
            .textCase(nil)
            
            Section(content: {
                Group {
                    Text("字重 Black")
                        .fontWeight(.black)
                    Text("字重 Heavy")
                        .fontWeight(.heavy)
                    Text("字重 Bold")
                        .fontWeight(.bold)
                    Text("字重 Semibold")
                        .fontWeight(.semibold)
                    Text("字重 Medium")
                        .fontWeight(.medium)
                    HStack {
                        Text("字重 Regular")
                            .fontWeight(.regular)
                        Text("(Default)")
                    }
                    Text("字重 Light")
                        .fontWeight(.light)
                    Text("字重 Thin")
                        .fontWeight(.thin)
                    Text("字重 UltraLight")
                        .fontWeight(.ultraLight)
                }
            },header:{Text("字重（粗细）（fontWeight）")})
            .textCase(nil)
            
        }
        //.navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle(Text("Text"))
    }
    
}

struct TestText_Previews: PreviewProvider {
    static var previews: some View {
        TestText()
    }
}
