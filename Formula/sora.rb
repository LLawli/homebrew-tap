class Sora < Formula
  desc "Distrobox commands as if they were native host commands"
  homepage "https://github.com/LLawli/sora"
  url "https://github.com/LLawli/sora/releases/download/v0.1.1/sora-0.1.1.tar.gz"
  sha256 "0d074d90b0f5a3bf83d40b0d9ef87a72bdd17f64d794bca4e33fc8c7b4dc6e2b"
  license "MIT"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sora version")
  end
end
