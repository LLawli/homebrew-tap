class JujutsuMcp < Formula
  desc "MCP server that lets coding agents use jj without a shell"
  homepage "https://github.com/LLawli/jujutsu-mcp"
  version "0.1.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.4/jujutsu-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "cca3b70ea236743b389f5393753cbba040b4470ec354562a1f3f0d620644abc6"
    end
    on_intel do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.4/jujutsu-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "97627c1770b9a512fca8da3cc0fe875afd1495d2247e11346a4affc9008cbef1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.4/jujutsu-mcp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "435ab1ed60939761a51238b7cb5c8d461e4c3e29c15d8251ebf9637b536a8881"
    end
    on_intel do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.4/jujutsu-mcp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6825a4e370f3e9f006625cfd0bcee666610ee40309e803a0a856b5f2ee1769b4"
    end
  end

  depends_on "jj"

  def install
    bin.install "jujutsu-mcp"
  end

  def caveats
    <<~EOS
      Register the server in Claude Code, Codex and Antigravity with:
        jujutsu-mcp setup
    EOS
  end

  test do
    assert_match "usage:", shell_output("#{bin}/jujutsu-mcp setup --bogus 2>&1", 2)
  end
end
