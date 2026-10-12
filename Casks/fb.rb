cask "fb" do
  version "0.1.1"
  sha256 "99d7fd752453b30ba972822fa46bef8e3bb600b4ada057c93380c69a305e030a"

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
end
