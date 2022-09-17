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
                    Text("Large title : 34")
                        .font(.largeTitle)
                    Text("title : 28")
                        .font(.title)
                    Text("title2 : 22")
                        .font(.title2)
                    Text("title3 : 20")
                        .font(.title3)
                    Text("headline : 17 : Semibold")
                        .font(.headline)
                    HStack {
                        Text("body : 17")
                            .font(.body)
                        Text("(default)")
                    }
                    Text("callout : 16")
                        .font(.callout)
                    Text("subheadline : 15")
                        .font(.subheadline)
                    Text("footnote : 13")
                        .font(.footnote)
                    Text("caption : 12")
                        .font(.caption)
                }
                Text("caption2 : 11")
                    .font(.caption2)
            }
                    ,header:{Text("字号（Large (Default)）Weight:Regular")})
            Section(content: {
                Group {
                    Text("Black")
                        .fontWeight(.black)
                    Text("Heavy")
                        .fontWeight(.heavy)
                    Text("Bold")
                        .fontWeight(.bold)
                    Text("Semibold")
                        .fontWeight(.semibold)
                    Text("Medium")
                        .fontWeight(.medium)
                    HStack {
                        Text("Regular")
                            .fontWeight(.regular)
                        Text("(Default)")
                    }
                    Text("Light")
                        .fontWeight(.light)
                    Text("Thin")
                        .fontWeight(.thin)
                    Text("ultraLight")
                        .fontWeight(.ultraLight)
                }
            }
                    ,header:{Text("字重（fontWeight）")})
            
        }
        .navigationTitle(Text("Text"))
    }
    
}

struct TestText_Previews: PreviewProvider {
    static var previews: some View {
        TestText()
    }
}
