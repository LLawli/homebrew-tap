class Sora < Formula
  desc "Distrobox commands as if they were native host commands"
  homepage "https://github.com/LLawli/sora"
  url "https://github.com/LLawli/sora/releases/download/v0.1.3/sora-0.1.3.tar.gz"
  sha256 "af49e5e65258326336db3226d3eb0854db0dee0485ba27947c8b42b1991a691f"
  license "MIT"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sora version")
  end
end
