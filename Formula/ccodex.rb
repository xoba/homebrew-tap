class Ccodex < Formula
  desc "Check Codex subscription usage, remaining quota, and reset times"
  homepage "https://github.com/xoba/ccodex"
  url "https://github.com/xoba/ccodex/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "31abcd7d0b54b61d96872d6f33c311e3e15aeafae241aa0007c8687c8a38d60f"
  license "MIT"
  head "https://github.com/xoba/ccodex.git", branch: "main"

  depends_on "go" => :build

  # ccodex records its history by running the sqlite3 command-line tool.
  uses_from_macos "sqlite"

  def install
    system "go", "build", *std_go_args(
      ldflags: "-s -w -X github.com/xoba/ccodex/internal/buildinfo.Version=#{version}",
    )
  end

  def caveats
    <<~EOS
      Requires the Codex CLI on your PATH and a ChatGPT sign-in:
        brew install --cask codex
        codex login

      Start read-only monitoring with low-quota alarms:
        ccodex watch

      Earned resets are used only with an explicit command or flag:
        ccodex watch --auto-reset
    EOS
  end

  test do
    assert_match "ccodex version #{version}", shell_output("#{bin}/ccodex --version")

    # Exercise account and quota reads without Codex, network access, or credentials.
    (testpath/"codex-mock").write <<~SH
      #!/bin/sh
      while IFS= read -r request; do
        case "$request" in
          *'"method":"initialize"'*)
            echo '{"id":1,"result":{}}' ;;
          *'"method":"account/read"'*)
            echo '{"id":2,"result":{"account":{"type":"chatgpt","planType":"pro"}}}' ;;
          *'"method":"account/rateLimits/read"'*)
            echo '{"id":3,"result":{"rateLimits":{"primary":{"usedPercent":25}}}}' ;;
          *'"method":"account/usage/read"'*)
            echo '{"id":4,"result":{"summary":{"lifetimeTokens":1234}}}' ;;
        esac
      done
    SH
    chmod 0755, testpath/"codex-mock"
    snapshot = JSON.parse(shell_output("#{bin}/ccodex status --json --codex-bin #{testpath}/codex-mock"))
    assert_equal "chatgpt", snapshot.dig("account", "type")
    assert_equal 25, snapshot.dig("rateLimits", "rateLimits", "primary", "usedPercent")
    assert_equal 1234, snapshot.dig("usage", "summary", "lifetimeTokens")

    # That check must have been saved to the history through sqlite3.
    assert_match "history.db", shell_output("#{bin}/ccodex history --path")
    check = JSON.parse(shell_output("#{bin}/ccodex history --json").lines.fetch(0))
    assert_equal "status", check["source"]
    assert_equal 25, check.dig("windows", 0, "usedPercent")
  end
end
