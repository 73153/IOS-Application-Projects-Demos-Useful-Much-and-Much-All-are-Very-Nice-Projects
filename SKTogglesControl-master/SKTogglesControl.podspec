Pod::Spec.new do |s|
  s.name     = 'SKTogglesControl'
  s.version  = '1.2'
  s.platform = :ios, '5.0'
  s.license  = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.summary  = 'Segmented toggles control for your iOS app.'
  s.homepage = 'https://github.com/steakknife/SKTogglesControl'
  s.author   = { 'Barry Allard' => 'barry.allard@gmail.com' } # originally Sam Vermette 
  s.source   = { :git => 'https://github.com/steakknife/SKTogglesControl.git', :tag => s.version.to_s }
  s.description = 'SKTogglesControl is a customizable multiple toggle UIControl based on SVSegmentedControl.'
  s.frameworks   = 'QuartzCore'
  s.source_files = 'SKTogglesControl/*.{h,m}'
  s.preserve_paths  = 'Demo'
  s.requires_arc = true
end
