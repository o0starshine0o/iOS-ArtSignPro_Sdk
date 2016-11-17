Pod::Spec.new do |spec|
    spec.name                = 'ArtSignProSdk'
    spec.version             = '0.0.1'
    spec.platform            = :ios, '9.0'
    spec.license             = { :type => 'MIT', :file => 'LICENSE.md' }
    spec.homepage            = 'https://github.com/o0starshine0o/iOS-ArtSignPro_Sdk'
    spec.authors             = { 'AbelHu' => 'tohys@qq.com' }
    spec.summary             = 'The core function of ArtSignPro'
    spec.description         = 'The core function of ArtSignPro.With this sdk,you can offer expert sign to your users,at the same time you will share the amount of the charge'

    spec.dependency            'Alamofire'
    spec.dependency            'Kingfisher'
    spec.dependency            'EZSwiftExtensions'
    spec.dependency            'SwiftyJSON'
    spec.dependency            'CryptoSwift'

    spec.source              = { :git => 'https://github.com/o0starshine0o/iOS-ArtSignPro_Sdk.git', :tag => "v#{spec.version}" }
    spec.source_files        = 'Source/**/*.{h,swift}'
    spec.resources           = ['Resources/**/*.{storyboard,string}']
    spec.framework           = 'Foundation', 'UIKit'
end
