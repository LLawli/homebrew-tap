class Xclaude < Formula
  desc "Real-time TUI dashboard for XClaudeUsage"
  homepage "https://github.com/LLawli/XClaudeDashboard"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/LLawli/XClaudeDashboard/releases/download/v0.2.0/xclaude-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "339ea6cabfd3e32f3998dbf700becb394a171c1d6e39b8ff1b60bf300e898950"
    end
    on_intel do
      # No prebuilt Intel-macOS binary is published; build from source.
      url "https://github.com/LLawli/XClaudeDashboard/archive/refs/tags/v0.2.0.tar.gz"
      sha256 "38d5e4d7d64128212ba5f9c844573b8c084409faef223fcfde449870d011b0e2"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/LLawli/XClaudeDashboard/releases/download/v0.2.0/xclaude-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "21033af52ca01c87a35d4e25cb82700ccf7e4ff05734b40a12760ac2b6cd4cb6"
    end
    on_arm do
      url "https://github.com/LLawli/XClaudeDashboard/releases/download/v0.2.0/xclaude-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "86a2b7e7c1faf692f1c1608b220e51569a795014e876c7cc05556005d1681f48"
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
