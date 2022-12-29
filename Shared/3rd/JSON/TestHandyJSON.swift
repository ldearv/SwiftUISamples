//
//  TestHandyJSON.swift
//  SwiftUISamples (iOS)
//
//  Created by wangmeng on 2022/9/21.
//

import SwiftUI

struct TestHandyJSON: View {
    var vm = TestHandyJSONViewModel()
    var body: some View {
        VStack {
            Button {
                vm.cbm2str()
            } label: {
                Text("cvm2str")
            }
        }
    }
}

struct TestHandyJSON_Previews: PreviewProvider {
    static var previews: some View {
        TestHandyJSON()
    }
}


import HandyJSON

struct BaseModel<T: HandyJSON> : HandyJSON {
    var code: String?
    var msg: String?
    var data: T?
}

struct TestData : HandyJSON {
    var n: Int?
    var str: String?
    var b: Bool?
    var array: Array<Any>?
    var dic: Dictionary<String, Any>?
}

struct TestData2 : HandyJSON {
    var t: Int?
    var v: String?
    var bb: Bool?
    var aa: Array<Any>?
    var dd: Dictionary<String, Any>?
}

class TestHandyJSONViewModel: ObservableObject {
    func cbm2str() {
//        var model = BaseModel<TestData>()
//        model.code = "200"
//        model.msg = "OK"
//        model.data = TestData(n: 3, str: "string", b: nil, array: [1, 2, 3], dic: ["key": 3])
//        print(model)
//
//        let json = model.toJSON()
//        print("json:\n\(json ?? ["转换失败":"转换失败"])")
//
//        let jsonStr = model.toJSONString()
//        print("jsonStr:\n\(jsonStr ?? "转换失败")")
//        let jsonStr = """
//{"code":"200","msg":"OK","data":{"dic":{"key":3},"str":"string","n":3,"b":ooo,"array":[1,2,3]}}
//"""
//        print("model.toJSONString(prettyPrint: false):\n\(model.toJSONString(prettyPrint: false) ?? "转换失败")")
//        print("model.toJSONString(prettyPrint: true):\n\(model.toJSONString(prettyPrint: true) ?? "转换失败")")
        let jsonStr = """
{"code":"200","msg":"OK","data":{"dic":{"key":3},"str":"string","n":3,"b":0,"array":[1,2,3, "sss"]}}
"""
        let model_1 = BaseModel<TestData2>.deserialize(from: jsonStr)
        print("model_1:")
        print(model_1 ?? "解析失败")
        
        let json_1 = model_1?.toJSON()
        print("json_1:\n\(json_1 ?? ["转换失败":"转换失败"])")
        
        let jsonStr_1 = model_1?.toJSONString()
        print("jsonStr_1:\n\(jsonStr_1 ?? "转换失败")")
        
        print("model_1?.toJSONString(prettyPrint: false):\n\(model_1?.toJSONString(prettyPrint: false) ?? "转换失败")")
        print("model_1?.toJSONString(prettyPrint: true):\n\(model_1?.toJSONString(prettyPrint: true) ?? "转换失败")")

        
        let model_2 = BaseModel<TestData>.deserialize(from: json_1)
        print("model_2:")
        print(model_2 ?? "解析失败")
        
        let model_3 = BaseModel<TestData>.deserialize(from: jsonStr_1)
        print("model_3:")
        print(model_3 ?? "解析失败")
    }
}
