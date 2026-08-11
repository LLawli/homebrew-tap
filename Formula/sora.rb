class Sora < Formula
  desc "Distrobox commands as if they were native host commands"
  homepage "https://github.com/LLawli/sora"
  url "https://github.com/LLawli/sora/releases/download/v0.2.0/sora-0.2.0.tar.gz"
  sha256 "392ab029367d61d57dba56cb2cf9c29a6a9172ff6ec8584962df2548e61440f6"
  license "MIT"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sora version")
  end
end
