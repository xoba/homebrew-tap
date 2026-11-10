cask "fb" do
  version "0.1.10"
  sha256 "a2e9cb89391e61e284611d0f63ad8073c84133f748c0ce873822300fba46593d"

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
