#
# Be sure to run `pod lib lint BezierRefreshControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BezierRefreshControl'
  s.version          = '1.0.0'
  s.summary          = 'A vector-based (using bezier paths) animated loading control (pull-to-refresh) for iOS scroll views (to be used in table & collection views).'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
BezierRefreshControl implements an animated way of drawing bezier paths to be used as a loading control in iOS scroll views - like in case of refreshing the content of a table view (or collection view) - pull-to-refresh action. Developer can provide its own bezier path at the initialisation phase of the control to be animated. The animation executes while data is loading (e.g. fetching data from a remote source/API).
                       DESC

  s.homepage         = 'https://github.com/cjd1884/bezier-refresh-control'
  s.screenshots     = 'https://media.giphy.com/media/TaOFG4SYsQa76/giphy.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'k.dimitros@gmail.com'
  s.source           = { :git => 'git@github.com:cjd1884/bezier-refresh-control.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/cjd1884'

  s.ios.deployment_target = '8.0'

  s.source_files = 'BezierRefreshControl/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BezierRefreshControl' => ['BezierRefreshControl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
end
