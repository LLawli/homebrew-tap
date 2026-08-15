class Sora < Formula
  desc "Distrobox commands as if they were native host commands"
  homepage "https://github.com/LLawli/sora"
  url "https://github.com/LLawli/sora/releases/download/v0.4.0/sora-0.4.0.tar.gz"
  sha256 "2cffc5da4d78ff7a56a58072bb8c47836860df38a4624ff96e791bfb4b80bf2f"
  license "MIT"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sora version")
  end
end
