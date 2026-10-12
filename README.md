# homebrew-tap

Homebrew formulas for [xoba](https://github.com/xoba) tools.

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

## fb — Legacy web server (deprecated)

The `fb` formula is deprecated as of October 12, 2026 in favor of the standalone
macOS app. Existing formula installations remain usable, and installing the
formula still works with a deprecation warning. Its source version and
dependencies have not changed.

The native app embeds its renderer and Pandoc without a localhost server. See
the [native build and installation instructions](https://github.com/xoba/fb/blob/main/macos/README.md).
A `fb` cask is planned after Developer ID signing, notarization, and release
verification are complete. It is not available from this tap yet; once published,
the explicit install command will be `brew install --cask xoba/tap/fb`.

To retire an existing background server:

```sh
brew services stop fb
brew uninstall --formula xoba/tap/fb  # optional: remove the old executable
```

The cask will install the app only; it will not silently stop an existing server
or remove the legacy formula. Users who still need the old web server can
explicitly install it with `brew install --formula xoba/tap/fb`.

## Updates

```sh
brew update
brew upgrade ccodex
```
