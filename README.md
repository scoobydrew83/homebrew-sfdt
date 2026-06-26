# Homebrew tap for sfdt

Homebrew tap for [`@sfdt/cli`](https://github.com/scoobydrew83/sfdt) — a CLI for
Salesforce DX deployment, testing, quality analysis, and release management.

## Install

```bash
brew install scoobydrew83/sfdt/sfdt
```

## Runtime prerequisites

The formula installs `sfdt` and Node. You also need, at runtime:

- **Salesforce CLI:** `npm install -g @salesforce/cli`
- **jq:** `brew install jq`

Optional: a Claude/Gemini/Codex CLI (or an HTTP AI provider) for AI features, and
`gh` for PR-creating commands.

## Maintenance

`Formula/sfdt.rb` pins a specific published npm tarball. On each `@sfdt/cli`
release, bump `url` (version) and `sha256`:

```bash
VERSION=x.y.z
shasum -a 256 <(curl -fsSL "https://registry.npmjs.org/@sfdt/cli/-/cli-${VERSION}.tgz")
```
