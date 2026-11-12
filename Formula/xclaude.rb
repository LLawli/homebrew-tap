class Xclaude < Formula
  desc "Real-time TUI dashboard for XClaudeUsage"
  homepage "https://github.com/LLawli/XClaudeDashboard"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/LLawli/XClaudeDashboard/releases/download/v0.3.0/xclaude-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "01184625e8e44a3c87f2e05512ec2fa6799b49cd0a71ed0b22ad0600e396b30a"
    end
    on_intel do
      # No prebuilt Intel-macOS binary is published; build from source.
      url "https://github.com/LLawli/XClaudeDashboard/archive/refs/tags/v0.3.0.tar.gz"
      sha256 "48d2e5de54925edfaa428ddb70796efb427661f7f3c1b52bf0fd77427f8ae6bb"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/LLawli/XClaudeDashboard/releases/download/v0.3.0/xclaude-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0f276dbf83405ed98106e21d027a4d922ff1d8990cdf8e0254bd51273132a82f"
    end
    on_arm do
      url "https://github.com/LLawli/XClaudeDashboard/releases/download/v0.3.0/xclaude-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9cffd8e356413e2004ff38d0721b3c8a21d0dadcc8d65a0d71edccf7b2f6e470"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "xclaude"
    end
  end

  def caveats
    <<~EOS
      xclaude is a companion viewer for XClaudeUsage:
        https://github.com/SrDarf/XClaudeUsage
      Install XClaudeUsage and let it run at least once before launching
      xclaude; it reads the SQLite log XClaudeUsage writes.
    EOS
  end

  test do
    assert_match "xclaude", shell_output("#{bin}/xclaude --version")
  end
end
