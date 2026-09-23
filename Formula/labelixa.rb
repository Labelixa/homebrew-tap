require "language/node"

class Labelixa < Formula
  desc "Lint and render ZPL, EPL, TSPL and CPCL label files from the command line via the Labelixa API - no printer required."
  homepage "https://labelixa.com/docs/cli"
  url "https://registry.npmjs.org/labelixa/-/labelixa-0.3.0.tgz"
  sha256 "f16b6dbd40ae849897e4ef8e58d1cf0bbc4de0b54bd8c731dee5ba839b4b1a97"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/labelixa --version")
    # `info` prints version, target API and auth mode without any network call.
    assert_match "labelixa", shell_output("#{bin}/labelixa info")
  end
end
