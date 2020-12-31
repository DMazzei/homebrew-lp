require "formula"

class BuckarooAT131 < Formula

  @@version = "1.3.1"

  homepage "https://github.com/loopperfect/buckaroo"

  url "https://github.com/LoopPerfect/buckaroo/releases/download/v" + @@version + "/buckaroo-cli.jar"
  sha256 "9f4c6e2da568ddd16aee3729fbdef1c5f2615722753bc152b43ebd59445b3bbb"

  head "https://github.com/LoopPerfect/buckaroo.git",
    :using => :git

  depends_on "openjdk@8"
  depends_on "buck"

  def install
    if head? then
      system "buck", "build", ":buckaroo-cli"
      libexec.install Dir["buck-out/gen/*"]
      bin.write_jar_script "#{libexec}/buckaroo-cli.jar", "buckaroo"
    else
      libexec.install "buckaroo-cli.jar"
      bin.write_jar_script libexec/"buckaroo-cli.jar", "buckaroo"
    end
  end

  def caveats
    "Anonymous usage statistics are enabled by default. \n" \
    "For more information and instructions for disabling analytics, visit: \n" \
    "https://buckaroo.readthedocs.io/"
  end
end
