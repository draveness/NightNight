Pod::Spec.new do |s|
  s.name             = 'NightNight'
  s.version          = '0.5.0'
  s.summary          = 'NightNight is a solution for integrating night mode which was written in swift.'

  s.description      = <<-DESC
NightNight is a framework to integrate night mode to application written in swift. NightNight provide MixedColor and MixedImage to fundamental UIKit and CoreAnimation layer. Hope you enjoy it!
                       DESC

  s.homepage         = 'https://github.com/draveness/NightNight'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Draveness' => 'stark.draven@gmail.com' }
  s.source           = { :git => 'https://github.com/draveness/NightNight.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.1'

  s.source_files = 'NightNight/Classes/**/*'
  
  s.frameworks = 'UIKit'
end
