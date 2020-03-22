Pod::Spec.new do |s|
  s.name         = "ShimmerLabel"
  s.version      = "1.0.0"
  s.summary      = "Shimmer animation for UILabel"
  s.description  = "UILabel subclass with shimmerColor property. Provides shimmer animation on the label"
  s.homepage     = "https://github.com/smakeev/ShimmerLabel"
  s.license      = { :type => 'MIT' }
  s.author       = { "Sergey Makeev" => "makeev.87@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       =  { :git => "https://github.com/smakeev/ShimmerLabel.git", :tag => "#{s.version}" }
  s.source_files  = "ShimmerLabel/ShimmerLabel/*.{swift}"
  s.exclude_files = "ShimmerLabel/ShimmerLabel/*.plist"
  s.swift_version = '5.1'
end
