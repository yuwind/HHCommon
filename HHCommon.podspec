
Pod::Spec.new do |s|
  s.name         = 'HHCommon' 
  s.summary      = 'HHCommon'
  s.version      = "1.0.8"
  s.description  = 'ui common method'
  s.homepage     = 'https://github.com/yuwind/HHCommon/wiki'
  s.license      = 'MIT'
  s.author       = { 'yufeng' => '991810133@qq.com' }
  s.platform     = :ios, '12.5'
  s.source       = { :git => "https://github.com/yuwind/HHCommon.git", :tag => s.version}
  s.source_files = 'HHCommon/*.{h,m}'
  s.requires_arc = true

end
