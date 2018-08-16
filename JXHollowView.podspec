#
#  Be sure to run `pod spec lint JXHollowView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "JXHollowView"
  s.version      = "1.0.1"
  s.summary      = "CALayer 技术实现镂空效果，常见与新功能指引等。"
  s.description  = <<-DESC
                    CALayer 技术实现镂空效果，常见与新功能指引等。暂且只支持 OC ，简单且可易扩展。
                   DESC
  s.homepage     = "https://github.com/itwyhuaing/JXHollowView"
  s.license      = "MIT"
  s.author       = { "wyhing" => "itwyhuaing@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/itwyhuaing/JXHollowView.git", :tag => "1.0.1" }
  s.source_files = "JXHollowView/*.{h,m}"
  s.requires_arc = true

end
