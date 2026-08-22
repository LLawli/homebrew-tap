class Sora < Formula
  desc "Distrobox commands as if they were native host commands"
  homepage "https://github.com/LLawli/sora"
  url "https://github.com/LLawli/sora/releases/download/v0.6.0/sora-0.6.0.tar.gz"
  sha256 "69c80fb13624360ef838c18f17d2a09869bb5c0a855176d5d0ad2310e4bfcf40"
  license "MIT"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sora version")
  end
end
