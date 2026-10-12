cask "fb" do
  version "0.1.0"
  sha256 "0380125a3779d2d0301d47e065c564aa86a678a69017d2c14821b1261f7be0f8"

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
