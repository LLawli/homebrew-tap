class Note < Formula
  desc "Take notes entirely from the terminal (CLI + TUI)"
  homepage "https://github.com/LLawli/note"
  version "0.1.0"
  license "MIT OR Apache-2.0"

  on_macos do
    url "https://github.com/LLawli/note/releases/download/v0.1.0/note-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "79e75fcc84283143f013da43cc7aec311bdc202a4a5c48c82110feb2d98eb1ba"
  end

  on_linux do
    on_intel do
      url "https://github.com/LLawli/note/releases/download/v0.1.0/note-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f655c45a3cb4cdb3e64223613ebc7da485f8ab635c774a05d089e6f521ac5f0e"
    end
    on_arm do
      url "https://github.com/LLawli/note/releases/download/v0.1.0/note-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4b7395cc2b4f70ec9b69aec69426766ab8b7bf30dab0672b661330dc83f877e"
    end
  end

  def install
    bin.install "note"
  end

  test do
    assert_match "note", shell_output("#{bin}/note --version")
  end
end
