class Note < Formula
  desc "Take notes entirely from the terminal (CLI + TUI)"
  homepage "https://github.com/LLawli/note"
  version "0.1.0"
  license "MIT OR Apache-2.0"

  on_macos do
    url "https://github.com/LLawli/note/releases/download/v0.1.0/note-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "866e6fd858fdc7555e15d9567f79e1df68f00f439583bb4d631b8e99d36e74f2"
  end

  on_linux do
    on_intel do
      url "https://github.com/LLawli/note/releases/download/v0.1.0/note-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "14f218f6e768c41f1e46d4786142050e4a2f137ef7503e86e3cb4c5e462db083"
    end
    on_arm do
      url "https://github.com/LLawli/note/releases/download/v0.1.0/note-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9cae70c047c9937897039d2661145c2449280273bc10b2c29bd3bb5fa349feb9"
    end
  end

  def install
    bin.install "note"
  end

  test do
    assert_match "note", shell_output("#{bin}/note --version")
  end
end
