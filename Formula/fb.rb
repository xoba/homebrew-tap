class Fb < Formula
  desc "Local file browser rendering documents, code, data, and archives as HTML"
  homepage "https://github.com/xoba/fb"
  url "https://github.com/xoba/fb/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "73c5997eafdaae1eca4d597045521618f7257e1a4f4403b3075597e74c0da885"
  license "MIT"
  revision 1
  head "https://github.com/xoba/fb.git", branch: "main"

  depends_on "go" => :build
  depends_on "pandoc"
  depends_on "typstyle"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  # With no argument fb serves the invoking user's home directory on
  # localhost:3030. The PATH must include Homebrew's bin so the server
  # finds pandoc; launchd provides nearly no environment on its own.
  service do
    run [opt_bin/"fb"]
    keep_alive true
    log_path var/"log/fb.log"
    error_log_path var/"log/fb.log"
    environment_variables PATH: std_service_path_env
  end

  def caveats
    <<~EOS
      Serves your home directory at http://localhost:3030/ by default;
      fb -port N (or FB_PORT) moves it, fb PATH serves a different root.
    EOS
  end

  test do
    assert_match "Usage: fb", shell_output("#{bin}/fb --help 2>&1", 2)
  end
end
