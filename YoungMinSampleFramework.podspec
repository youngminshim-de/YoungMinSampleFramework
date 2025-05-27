Pod::Spec.new do |s|
  s.name         = 'YoungMinSampleFramework'
  s.version      = '0.0.10'
  s.summary      = 'A reusable SDK named YoungminSampleFramework.'
  s.description  = <<-DESC
    This is a binary SDK distributed via CocoaPods, packaged as an xcframework.
    It supports iOS platform and is distributed as a zip archive.
  DESC

  s.homepage     = 'https://github.com/youngminshim-de/YoungMinSampleFramework'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'youngminshim-de' => 'ym.sim@cardoc.kr' }

  s.platform     = :ios, '12.0'
  s.swift_version = '5.0'

  s.source = {
    :http => 'https://github.com/youngminshim-de/YoungMinSampleFramework/releases/download/0.0.10/YoungMinSampleFramework-0.0.10.zip',
    :sha256 => '057fff53984b66d96b5458acee56221c3d6ca384159738578ab5f0b49cdb3acd'
  }

  s.vendored_frameworks = 'YoungminSampleFramework.xcframework'
end
