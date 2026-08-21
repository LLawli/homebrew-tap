class Sora < Formula
  desc "Distrobox commands as if they were native host commands"
  homepage "https://github.com/LLawli/sora"
  url "https://github.com/LLawli/sora/releases/download/v0.5.0/sora-0.5.0.tar.gz"
  sha256 "eb4f2f7109e8e14db86059b706946139da8c138577ccda561c3b8e1b96b03aba"
  license "MIT"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sora version")
  end
end
