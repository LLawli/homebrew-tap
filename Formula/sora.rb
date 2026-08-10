class Sora < Formula
  desc "Distrobox commands as if they were native host commands"
  homepage "https://github.com/LLawli/sora"
  url "https://github.com/LLawli/sora/releases/download/v0.1.0/sora-0.1.0.tar.gz"
  sha256 "56b4b0e5aad8105863bd790a1772511bd0077ea779df77e7f9e2d1bfcf8aeb5a"
  license "MIT"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sora version")
  end
end
