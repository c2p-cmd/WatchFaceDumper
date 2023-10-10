Pod::Spec.new do |spec|
  spec.name         = "Watchface"
  spec.version      = "0.0.2"
  spec.summary      = "Apple Watch watch face file (.watchface) decoder/encoder"
  spec.description  = <<-DESC
  Apple Watch watch face file (.watchface) decoder / encoder with NSFileWrapper support
                   DESC
  spec.homepage     = "https://github.com/banjun/WatchFaceDumper"
  spec.license      = "MIT"
  spec.authors            = { "banjun" => "banjun@gmail.com" }
  # spec.social_media_url   = "https://twitter.com/banjun"
  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "10.11"
  spec.source       = { :git => "https://github.com/c2p-cmd/WatchFaceDumper.git", :branch = main }
  spec.source_files  = "Watchface/**/*.swift"
  spec.swift_versions = ["5.0"]
end
