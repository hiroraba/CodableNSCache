Pod::Spec.new do |s|
  s.name         = "CodableNSCache"
  s.version      = "0.0.1"
  s.summary      = "Use Codable Object in NSCache"
  s.homepage     = "https://github.com/hiroraba/CodableNSCache"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Hiroki Matsuo" => "xornelius0313@gmail.com" }
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/hiroraba/CodableNSCache.git", :tag => s.version.to_s }
  s.source_files  = "Sources/*.swift"
end
