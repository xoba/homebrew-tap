cask "fb" do
  version "0.1.2"
  sha256 "314ad470a4e55a5ceb6de4f6dd7b837587ff49cb3decff1cf225dd582c112670"

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
