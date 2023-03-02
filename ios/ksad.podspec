#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint ksad.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'ksad'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.static_framework = true
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
 # s.dependency 'KSAdSDK', '3.3.38.1'
  s.frameworks = ["StoreKit","AdSupport","CoreLocation","SystemConfiguration","CoreTelephony","Security","AVFoundation","WebKit","AudioToolbox","CoreGraphics","CoreImage","CoreText","JavaScriptCore","MapKit","UIKit","MobileCoreServices","MediaPlayer","CoreMedia","CoreMotion","Accelerate","ImageIO","QuartzCore","Foundation","CoreData","AVKit","MessageUI","QuickLook","AddressBook","AppTrackingTransparency","CFNetwork","SafariServices","DeviceCheck"]
  s.libraries = ["z","xml2","c++abi","resolv.9","c++","sqlite3","bz2","iconv", "resolv.9","bz2.1.0"]
  s.vendored_frameworks = 'SDK/KSAdSDK.framework'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
