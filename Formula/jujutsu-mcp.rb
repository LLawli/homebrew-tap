class JujutsuMcp < Formula
  desc "MCP server that lets coding agents use jj without a shell"
  homepage "https://github.com/LLawli/jujutsu-mcp"
  version "0.1.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.2/jujutsu-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "73338fad5b4e6368b087e111436c3df3430de8faae395566b389a42b10ef864f"
    end
    on_intel do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.2/jujutsu-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "3157670c5397924beb9e8148617da052cbc3d71c35908ea0e5c84fecd273b841"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.2/jujutsu-mcp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "096bf83fddaf5a9f33f304ae17f605a5af3b2b661774e50f241d7742ca80a36e"
    end
    on_intel do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.2/jujutsu-mcp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d1c709e408b1c1a62031bb0ef1a3e1ce4c8f5444ad241588892bc7482b16d81b"
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
