cask "fb" do
  version "0.1.3"
  sha256 "07c1cd60779c3f94b6eb793ef9ebfcef023c4e2eb499feb75a2a184089e8ce71"

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
