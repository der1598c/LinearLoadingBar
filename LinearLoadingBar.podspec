#
# Be sure to run `pod lib lint LinearLoadingBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LinearLoadingBar'
  s.version          = '0.1.0'
  s.summary          = 'A short description of LinearLoadingBar.Allows you to set the title and lead angle. Clone from https://github.com/BiAtoms/LinearProgressView'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.swift_version    = "4.2"
  s.homepage         = 'https://github.com/der1598c/LinearLoadingBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'der1598c' => 'der1598c@gmail.com' }
  s.source           = { :git => 'https://github.com/der1598c/LinearLoadingBar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LinearLoadingBar/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LinearLoadingBar' => ['LinearLoadingBar/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
