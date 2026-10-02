class JujutsuMcp < Formula
  desc "MCP server that lets coding agents use jj without a shell"
  homepage "https://github.com/LLawli/jujutsu-mcp"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.0/jujutsu-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "47f30080802ea63eb8139702f3699df7c16b69178fb4d9c02263a951c522b0af"
    end
    on_intel do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.0/jujutsu-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "cb1ae3d9fd6bfad7ec487dd0b5febd31ab486abc89abf727539245a73bf35e9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.0/jujutsu-mcp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4c402b444d67c14c37f14ac4ed416f89f2443b24640217cea59fc09e1fe371a5"
    end
    on_intel do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.0/jujutsu-mcp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7400a7757a672b8d4519d9969221b22c9b2abc6556f753d875df91fef73639ad"
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
