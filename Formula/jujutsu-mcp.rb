class JujutsuMcp < Formula
  desc "MCP server that lets coding agents use jj without a shell"
  homepage "https://github.com/LLawli/jujutsu-mcp"
  version "0.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.1/jujutsu-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "89821d60be6a6eda991c855e6273c32bcd116990b6e9ce4ad479e2cef81273a0"
    end
    on_intel do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.1/jujutsu-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "d15fc7a0a481c76f6d77852bf442e95a356523884980a071051bb600e1d31cfa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.1/jujutsu-mcp-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0fc83b3e43129001ee13552f4c615f0b80692f4264be6332995bea32d1e396c8"
    end
    on_intel do
      url "https://github.com/LLawli/jujutsu-mcp/releases/download/v0.1.1/jujutsu-mcp-x86_64-unknown-linux-musl.tar.gz"
      sha256 "29825626582551a6ddbc4a8ce8b4baeb40d24e99f259691a035dd21d52dcbcec"
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
