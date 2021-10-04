platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end

target 'TemplateProject' do
  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'Kingfisher'
  pod 'IQKeyboardManagerSwift'
  pod 'SwiftyJSON'
  pod 'PKHUD'
  pod 'FacebookCore'
  pod 'FacebookLogin'
  pod 'GoogleSignIn'
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  pod 'RxSwift'
  pod 'RxCocoa'
end
