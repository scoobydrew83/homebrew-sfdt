require "language/node"

# Homebrew formula for @sfdt/cli.
#
# Distribution model: this installs the published npm package into the formula's
# libexec and symlinks the `sfdt` bin onto PATH. The url + sha256 below MUST be
# bumped on every release (see the `release` skill checklist):
#
#   VERSION=x.y.z
#   url    -> https://registry.npmjs.org/@sfdt/cli/-/cli-${VERSION}.tgz
#   sha256 -> shasum -a 256 of that tarball
#
# Install (from the tap):
#   brew install scoobydrew83/sfdt/sfdt
class Sfdt < Formula
  desc "Salesforce DX deployment, testing, quality analysis, and release CLI"
  homepage "https://github.com/scoobydrew83/sfdt"
  url "https://registry.npmjs.org/@sfdt/cli/-/cli-0.23.1.tgz"
  sha256 "7cedd02260f1fd4a3477a7f4b7b6035b6d641fec626963ff41d0f527691b739f"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      sfdt needs these at runtime (not installed by this formula):
        - Salesforce CLI:  npm install -g @salesforce/cli
        - jq:              brew install jq

      Optional, for AI features and PR creation:
        - Claude Code / Gemini / Codex CLI  (or configure an HTTP provider)
        - GitHub CLI:  brew install gh

      Get started:
        cd your-sf-project && sfdt init
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sfdt --version")
  end
end
