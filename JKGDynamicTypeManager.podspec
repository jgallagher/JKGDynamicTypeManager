Pod::Spec.new do |s|
  s.name         = "JKGDynamicTypeManager"
  s.version      = "0.1.0"
  s.summary      = "Utility class for automatically managing iOS 7+ Dynamic Type"
  s.description  = <<-DESC
                    JKGDynamicTypeManager includes a class that will manage
                    any objects with a font property (particularly UILabel,
                    UITextField, and UITextView), watching for changes in the
                    system-wide dynamic type size and resetting the fonts
                    on watched views appropriately.

                    The optional Controls subspec includes subclasses of
                    UILabel, UITextField, and UITextView that can be used from
                    XIB files that will automatically register themselves
                    to be watched by JKGDynamicTypeManager.
                   DESC
  s.homepage     = "https://github.com/jgallagher/JKGDynamicTypeManager"
  s.license      = 'MIT'
  s.author       = { "John Gallagher" => "johnkgallagher@gmail.com" }
  s.source       = { :git => "https://github.com/jgallagher/JKGDynamicTypeManager.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true

  s.subspec 'Core' do |core|
      core.source_files = 'Classes/Core/*.{h,m}'
  end

  s.subspec 'Controls' do |controls|
      controls.dependency 'JKGDynamicTypeManager/Core'
      controls.source_files = 'Classes/Controls/*.{h,m}'
  end
end
