class Sora < Formula
  desc "Distrobox commands as if they were native host commands"
  homepage "https://github.com/LLawli/sora"
  url "https://github.com/LLawli/sora/releases/download/v0.3.0/sora-0.3.0.tar.gz"
  sha256 "d1ac50aee0fe5a66952fb33c9f5262def40d4d1dffc8e476613820ac975b65d8"
  license "MIT"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sora version")
  end
end
