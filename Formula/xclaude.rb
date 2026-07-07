class Xclaude < Formula
  desc "Real-time TUI dashboard for XClaudeUsage"
  homepage "https://github.com/LLawli/XClaudeDashboard"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/LLawli/XClaudeDashboard/releases/download/v0.1.0/xclaude-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "b7bc6e5ead36ca5279fbfada40da7418c1b0b6d25f9ea6086893a1ca37c68849"
    end
    on_intel do
      # No prebuilt Intel-macOS binary is published — build from source.
      url "https://github.com/LLawli/XClaudeDashboard/archive/refs/tags/v0.1.0.tar.gz"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/LLawli/XClaudeDashboard/releases/download/v0.1.0/xclaude-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0730d82b9391c4928fa08ba6766582f75388350c93f26dbc17678eb70565a2e6"
    end
    on_arm do
      url "https://github.com/LLawli/XClaudeDashboard/releases/download/v0.1.0/xclaude-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a617d45d6fcf429d4bfcd1b954062129f2f079865b497dfe12f1c8fbe8db7f8a"
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
      xclaude — it reads the SQLite log XClaudeUsage writes.
    EOS
  end

  test do
    assert_match "xclaude", shell_output("#{bin}/xclaude --version")
  end
end
