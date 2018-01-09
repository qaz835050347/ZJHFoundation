
Pod::Spec.new do |s|
s.name         = "ZJHFoundation"
  s.version      = "0.0.1"
  s.summary      = "ZJHFoundation is a foundation"

  s.homepage     = "https://github.com/qaz835050347/ZJHFoundation.git"
  s.license      = "MIT"
  s.author       = { "qaz835050347" => "835050347@qq.com" }
  s.platform     = :ios, "8.0"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/qaz835050347/ZJHFoundation.git", :tag => "#{s.version}" }
  s.source_files  = "ZJHFoundation/Sources/**/*.{h,m,c}"
  s.resources = 'ZJHFoundation/Sources/**/*.{json,png,jpg,gif,xib,bundle}'
  #s.exclude_files = "Classes/Exclude"
  s.public_header_files = "ZJHFoundation/Sources/ZJHFoundationHeader.h"

  s.frameworks   = 'UIKit','runtime'

end
