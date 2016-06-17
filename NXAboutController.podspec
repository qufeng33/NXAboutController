Pod::Spec.new do |s|
s.name         = 'NXAboutController'
s.version      = '0.1.0'
s.summary      = '一套简单的关于我们的界面'
s.homepage     = 'https://github.com/qufeng33/NXAboutController.git'
s.license      = 'MIT'
s.author       = { 'nightx' => 'qufeng33@hotmail.com' }
s.platform     = :ios, '8.0'
s.source       = { :git => 'https://github.com/qufeng33/NXAboutController.git', :tag => s.version.to_s}
s.source_files = 'NXAboutController/**/*'
s.requires_arc = true
s.frameworks   = 'UIKit'
s.dependency 'Masonry'
end