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

## fb — Local file browser

```sh
brew install xoba/tap/fb     # local file browser at http://localhost:3030
brew services start fb      # serve your home directory, starting at login
```

## Updates

```sh
brew update
brew upgrade ccodex         # or: brew upgrade fb
```
