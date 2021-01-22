Pod::Spec.new do |s|
  s.name             = 'RTCardScan'
  s.version          = '2.0.7.8'
  s.summary          = 'Scan credit cards'
  s.description      = <<-DESC
CardScan is a library for scanning credit cards.
                       DESC

  s.homepage         = 'https://cardscan.io'
  s.license          = { :type => 'Custom', :file => 'LICENSE' }
  s.author           = { 'Sam King' => 'kingst@gmail.com' }
  s.source           = { :git => 'https://github.com/RakutenTravelNative/cardscan-ios.git', :tag => s.version.to_s }

  # lint warning, who knows
  #s.social_media_url = 'https://twitter.com/stk'
  s.default_subspec = 'Core'
  s.ios.deployment_target = '11.0'
  s.swift_version = '5.3.1'
  s.subspec 'Core' do |core|
    core.source_files = 'CardScan/Classes/**/*'
    core.resource_bundles = { 'CardScan' => ['CardScan/Resources/Assets/*.xcassets', 'CardScan/Resources/*.storyboard', 'CardScan/Assets/*.mlmodelc'] }
    core.weak_frameworks = 'AVKit', 'CoreML', 'VideoToolbox', 'Vision', 'UIKit', 'AVFoundation'
  end

  s.subspec 'Stripe' do |stripe|
    stripe.source_files = 'CardScan/Classes/**/*'
    stripe.resource_bundles = { 'CardScan' => ['CardScan/Resources/Assets/*.xcassets', 'CardScan/Resources/*.storyboard', 'CardScan/Assets/*.mlmodelc'] }
    stripe.weak_frameworks = 'AVKit', 'CoreML', 'VideoToolbox', 'Vision', 'UIKit', 'AVFoundation'
    stripe.dependency  'Stripe'
  end
end
