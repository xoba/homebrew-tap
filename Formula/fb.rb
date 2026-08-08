class Fb < Formula
  desc "Local file browser rendering documents, code, data, and archives as HTML"
  homepage "https://github.com/xoba/fb"
  url "https://github.com/xoba/fb/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "82e1939bd3afd0673a1e035a8ec497f503e5770f24a4636cbd73aefc61e70784"
  license "MIT"
  head "https://github.com/xoba/fb.git", branch: "main"

  depends_on "go" => :build
  depends_on "pandoc"
  depends_on "typstyle"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}")
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
      Serves your home directory at http://localhost:3030/ by default.
      If that port is taken, fb uses the next free one — the log
      (#{var}/log/fb.log) names it.

      To change the port or serve root, including for the service,
      write ~/.config/fb/config:
        port = 8080
        root = /some/path
      then: brew services restart fb
    EOS
  end

  test do
    assert_match "Usage: fb", shell_output("#{bin}/fb --help 2>&1", 2)
  end
end
