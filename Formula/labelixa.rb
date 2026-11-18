require "language/node"

class Labelixa < Formula
  desc "Lint and render ZPL, EPL, TSPL and CPCL label files via the Labelixa API"
  homepage "https://labelixa.com/docs/cli"
  url "https://registry.npmjs.org/labelixa/-/labelixa-0.4.0.tgz"
  sha256 "f5b8746afb4d64b901deba6c0c9b4537a69a96ca1b3f7ba465f30ea88a1c55d2"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/labelixa --version")
    # `info` prints version, target API and auth mode without any network call.
    assert_match "labelixa", shell_output("#{bin}/labelixa info")
  end
end
