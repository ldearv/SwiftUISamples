//
//  CustomAlertView.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/20.
//

import SwiftUI
import Foundation
import UIKit

struct CustomAlertView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Button("test") {
                let newName = alertWithTextField(title: "重命名", message: "输入新名称")
                print("新名称：\(newName)")
            }
        }
        
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView()
    }
}

public func alertWithTextField(title: String, message: String) -> String {
    var textFieldText: String = ""
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addTextField() { textField in
        textField.placeholder = "在此输入内容"
    }
    alert.addAction(UIAlertAction(title: "取消", style: .cancel) {_ in})
    alert.addAction(UIAlertAction(title: "确认", style: .default) {_ in
        let textField = alert.textFields![0]
        textFieldText = textField.text ?? ""
        print(textField.text ?? "")
    })
    alert.addAction(UIAlertAction(title: "增加按钮测试", style: .destructive) {_ in})
    showAlert(alert: alert)
    return textFieldText
}

func showAlert(alert: UIAlertController) {
    if let controller = topMostViewController() {
        controller.present(alert, animated: true)
    }
}

private func keyWindow() -> UIWindow? {
    return UIApplication.shared.connectedScenes
        .filter {$0.activationState == .foregroundActive}
        .compactMap {$0 as? UIWindowScene}
        .first?.windows.filter {$0.isKeyWindow}.first
}

private func topMostViewController() -> UIViewController? {
    guard let rootController = keyWindow()?.rootViewController else {
        return nil
    }
    return topMostViewController(for: rootController)
}

private func topMostViewController(for controller: UIViewController) -> UIViewController {
    if let presentedController = controller.presentedViewController {
        return topMostViewController(for: presentedController)
    } else if let navigationController = controller as? UINavigationController {
        guard let topController = navigationController.topViewController else {
            return navigationController
        }
        return topMostViewController(for: topController)
    } else if let tabController = controller as? UITabBarController {
        guard let topController = tabController.selectedViewController else {
            return tabController
        }
        return topMostViewController(for: topController)
    }
    return controller
}
