cask "fb" do
  version "0.1.6"
  sha256 "d0215fe1a0d74b1bd7892f9f31866567d88ceea2c77ae02c9d94eaf5cd1c8fc7"

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
