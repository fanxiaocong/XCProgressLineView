Pod::Spec.new do |s|

  s.name         = "XCProgressLineView"
  s.version      = "1.0.1"
  s.summary      = "ProgressLineView"

  s.description  = "ProgressLineView自定义进度条"

  s.homepage     = "https://github.com/fanxiaocong/XCProgressLineView"

  s.license      = "MIT"


  s.author       = { "樊小聪" => "1016697223@qq.com" }


  s.source       = { :git => "https://github.com/fanxiaocong/XCProgressLineView.git", :tag => s.version }


  s.source_files  = "XCProgressLineView"
  s.requires_arc  = true
  s.platform     = :ios, "8.0"
  s.frameworks   =  'UIKit'

end
