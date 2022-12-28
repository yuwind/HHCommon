
Pod::Spec.new do |s|
  s.name         = 'HHCommon' 
  s.summary      = 'HHCommon'
  s.version      = "1.0.4"
  s.description  = 'ui common method'
  s.homepage     = 'https://github.com/yuwind/HHCommon/wiki'
  s.license      = 'MIT'
  s.author       = { 'yufeng' => '991810133@qq.com' }
  s.platform     = :ios, '10.0'
  s.source       = { :git => "https://github.com/yuwind/HHCommon.git", :tag => s.version}
  s.source_files = 'HHCommon/*/*.{h,m}'
  s.resource     = 'HHCommon/Base/BaseBundle.bundle'
  s.requires_arc = true

end
