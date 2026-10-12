# homebrew-tap

Homebrew formulas and casks for [xoba](https://github.com/xoba) tools.

## ccodex — Check Codex

[ccodex](https://github.com/xoba/ccodex) shows Codex subscription usage, remaining
quota, and reset times. Monitoring is read-only by default.

```sh
brew install xoba/tap/ccodex
ccodex watch
```

Requires the Codex CLI and a ChatGPT sign-in. See the
[quick start](https://github.com/xoba/ccodex#quick-start) for setup. Automatic
earned resets require an explicit `ccodex watch --auto-reset` flag.

## fb — Standalone macOS app

[fb](https://github.com/xoba/fb) browses local files and renders documents, code,
email messages, spreadsheets, databases, and archives. The app embeds its
renderer and Pandoc without a localhost server. It requires Apple Silicon and
macOS 26 or later, and is signed with Developer ID and notarized by Apple.
Version 0.1.2 adds `.eml` browsing with a MIME part tree, readable messages,
attachments, and a folder inbox view. It also includes toolbar and navigation
improvements, with zoom preferences still saved across app launches.

If you installed the legacy `fb` formula, stop its background service and remove
the old command-line package first. Fresh installations can skip these two steps.

```sh
brew services stop fb
brew uninstall --formula xoba/tap/fb
```

Then install the app:

```sh
brew install --cask xoba/tap/fb
```

Use `--cask` to select the app: this tap also retains the deprecated `fb` formula.
For a direct download, see the
[macOS 0.1.2 release](https://github.com/xoba/fb/releases/tag/mac-v0.1.2).
Build instructions are in the
[macOS app documentation](https://github.com/xoba/fb/blob/main/macos/README.md).

The `fb` formula is deprecated as of October 12, 2026 in favor of the standalone
macOS app. Existing formula installations remain usable, and installing the
formula still works with a deprecation warning. Its source version and
dependencies have not changed.

The cask installs the app only; it does not stop an existing server
or remove the legacy formula. Users who still need the old web server can
explicitly install it with `brew install --formula xoba/tap/fb`.

### Open from the terminal

Open a file or the current directory in the installed app:

```sh
open -b com.xoba.fb.app -- README.md
open -b com.xoba.fb.app -- .
```

See [terminal usage](https://github.com/xoba/fb#open-from-the-terminal) for more
examples and an optional shell shortcut.

## Updates

```sh
brew update
brew upgrade ccodex
brew upgrade --cask xoba/tap/fb
```
