cask "fb" do
  version "0.1.8"
  sha256 "86f0893c084a9495c2781914320908489c11bb2c9af8408cf92b586ca8508ed2"

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
