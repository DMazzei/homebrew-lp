require "formula"

class BuckarooAT130 < Formula
  homepage "https://github.com/loopperfect/buckaroo"

  url "https://github.com/LoopPerfect/buckaroo.git",
    :tag => "v1.3.0"

  head "https://github.com/LoopPerfect/buckaroo.git",
    :using => :git

  depends_on "openjdk@8"
  depends_on "buck"

  def install
    system "buck", "build", ":buckaroo-cli"
    libexec.install Dir["buck-out/gen/*"]
    bin.write_jar_script "#{libexec}/buckaroo-cli.jar", "buckaroo"
  end

  def caveats
    "Anonymous usage statistics are enabled by default. \n" \
    "For more information and instructions for disabling analytics, visit: \n" \
    "https://buckaroo.readthedocs.io/"
  end
end
