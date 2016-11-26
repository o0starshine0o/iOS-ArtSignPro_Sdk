Pod::Spec.new do |spec|
    spec.name                = 'ArtSignProSdk'
    spec.version             = '0.0.2'
    spec.platform            = :ios, '9.0'
    spec.license             = { :type => 'MIT', :file => 'LICENSE.md' }
    spec.homepage            = 'https://github.com/o0starshine0o/iOS-ArtSignProDemo'
    spec.authors             = { 'AbelHu' => 'tohys@qq.com' }
    spec.summary             = 'The core function of ArtSignPro'
    spec.description         = 'The core function of ArtSignPro.With this sdk,you can offer expert sign to your users,at the same time you will share the amount of the charge'

    spec.dependency            'Alamofire'
    spec.dependency            'Kingfisher'
    spec.dependency            'EZSwiftExtensions'
    spec.dependency            'SwiftyJSON'
    spec.dependency            'CryptoSwift'
    spec.dependency            'SwiftSpinner'
    spec.dependency            'Toast-Swift'
    spec.dependency            'M13Checkbox'
    spec.dependency            'IQKeyboardManager'
    spec.dependency            'AutoLayoutTextViews'

    spec.source              = { :git => 'https://github.com/o0starshine0o/iOS-ArtSignPro_Sdk.git', :tag => "v#{spec.version}" }
    spec.default_subspec     = 'Core', 'Pay', 'Alipay', 'WeChat'

    spec.subspec 'Core' do |core|
        core.source_files='Source/**/*.swift', 'Headers/*.h'
        core.resource='Resources/**/*.*'
        core.private_header_files = 'Headers/*.h'
        core.dependency 'ArtSignProSdk/Pay'
    end

    spec.subspec 'Pay' do |pay|
        pay.source_files = 'lib/*.h', 'lib/Dependencies/Network/*.h'
        pay.public_header_files = 'lib/*.h', 'lib/Dependencies/Network/*.h'
        pay.vendored_libraries = 'lib/*.a', 'lib/Dependencies/Network/*.a'
        pay.resource = 'lib/*.bundle'
        pay.frameworks = 'CFNetwork', 'SystemConfiguration', 'Security'
        pay.ios.library = 'c++', 'stdc++', 'z'
        pay.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
    end

    spec.subspec 'Alipay' do |ss|
        ss.vendored_libraries = 'lib/Channels/Alipay/*.a'
        ss.ios.vendored_frameworks = 'lib/Channels/Alipay/AlipaySDK.framework'
        ss.resource = 'lib/Channels/Alipay/AlipaySDK.bundle'
        ss.frameworks = 'CoreMotion', 'CoreTelephony'
        ss.dependency 'ArtSignProSdk/Pay'
    end

    spec.subspec 'WeChat' do |ss|
        ss.dependency 'ArtSignProSdk/Pay'
    end
end
