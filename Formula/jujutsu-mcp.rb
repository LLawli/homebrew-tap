class JujutsuMcp < Formula
  desc "MCP server that lets coding agents use jj without a shell"
  homepage "https://github.com/LLawli/jujutsu-mcp"
  version "0.1.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.3/jujutsu-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "9fa491f57a245a53ab36382db801336fd10b11fefc7224ef3957b0c1532027c0"
    end
    on_intel do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.3/jujutsu-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "805dbcc07c6a4eab57996877dc7757ce18b05f71d99d1ae084ff2bd3644f5162"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.3/jujutsu-mcp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "042dc2dbecf78ba8c90ec7248bb02aa8914bec78eb66591c7f85c8309505844f"
    end
    on_intel do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.3/jujutsu-mcp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ecaccb620093453d3af7c4dc48ea95d430ec4df8d838ae1c9534958bac6ce485"
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
