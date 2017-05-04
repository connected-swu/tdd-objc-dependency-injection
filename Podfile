source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

def sharedPods
  pod 'Blindside'
  pod 'BlindsidedStoryboard'
end

target 'tddObjcDepInjection' do
  sharedPods
end

target 'tddObjcDepInjectionTests' do
  sharedPods
  pod 'Cedar', :git => 'https://github.com/pivotal/cedar.git'
end
