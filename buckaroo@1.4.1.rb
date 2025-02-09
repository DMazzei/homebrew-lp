require "formula"

class BuckarooAT141 < Formula

  @@version = "1.4.1"

  homepage "https://github.com/loopperfect/buckaroo"

  url "https://github.com/LoopPerfect/buckaroo/releases/download/v" + @@version + "/buckaroo-cli.jar"
  sha256 "025582b9b67788251a3d1fa8a72ca596a0ce09a0f782b4934bbe773b91d651ba"

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
