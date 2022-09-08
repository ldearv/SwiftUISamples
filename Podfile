# Uncomment the next line to define a global platform for your project
# platform :ios, '14.0'

target 'SwiftUISamples (iOS)' do
  platform :ios, '14.0'
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  use_frameworks!

  pod 'Moya'
  pod 'HandyJSON'
  pod 'SDWebImageSwiftUI'
  pod 'SDWebImage', :modular_headers => true, :inhibit_warnings => true

end


target 'SwiftUISamples (macOS)' do
  platform :macos, '12.0'
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  use_frameworks!

  pod 'Moya'
  pod 'HandyJSON'
  pod 'SDWebImageSwiftUI'
  pod 'SDWebImage', :modular_headers => true, :inhibit_warnings => true

end

# 问题1：执行pod install时，报错内容中有“RuntimeError - [Xcodeproj] Unknown object version.”字样。
# 分析原因：目前使用的CocoaPod 版本号为1.9.3，不支持最新的Xcode
# 解决方法： 一种方案是升级CocoaPod；另一种方案是将项目的Project Format修改为Xcode 12.0-compatible或以下，位置在打开Xcode，选中左边栏项目名后，右边栏“Project Document”下的第一项。

# 问题2：pod install后iOS编译成功，macOS编译失败，warning找不到安装的第三方库，error not found Alamofire。
# 分析原因：原来没有target内部的platform设定，只在第2行设定了ios。造成macOS实际上没有编译第三方库
# 解决方法：在target中分别设定platform

# 问题3：pod拉取SDWebImageSwiftUI会提示拉取SDWebImage header类似的问题。本次测试并没有出现。
# 分析原因：第三方库依赖另一个第三方库时出现的问题。
# 解决方法：根据提示在报错的库添加“:modular_headers => true”，实际上直接添加会出现错误。要先添加“,”,再添加“:modular_headers => true”。

# 问题4：pod install成功后，编译时Xcode会有个warning：“Update to recommended”，点击后有个弹框要修改第三方库支持的最低版本。点击“Perform Changes”按钮后再编译，SDWebImage会报很多warning。
# 解决方法：在'SDWebImage'后添加“, :inhibit_warnings => true”屏蔽。
