cask "fb" do
  version "0.1.11"
  sha256 "61e480ea1e2a52c3eb7fdd1ae728654eb9b36f0a5b7213e4a6a49cbdef843ec6"

  url "https://github.com/xoba/fb/releases/download/mac-v#{version}/fb-#{version}-arm64-notarized.zip"
  name "fb"
  desc "Local file browser and document viewer"
  homepage "https://github.com/xoba/fb"

  livecheck do
    skip "Updated through the signed macOS release workflow"
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "fb.app"
  binary "#{appdir}/fb.app/Contents/Resources/bin/fb"
end
