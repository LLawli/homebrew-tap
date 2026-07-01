class Note < Formula
  desc "Take notes entirely from the terminal (CLI + TUI)"
  homepage "https://github.com/LLawli/note"
  version "0.1.1"
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/LLawli/note/releases/download/v0.1.1/note-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "af14cd0d64a3f14179c827f3ed8cdc0c5016fe9249a18e57156bdc7e0819a83c"
    end
    on_intel do
      # No prebuilt Intel-macOS binary is published — build from source.
      url "https://github.com/LLawli/note/archive/refs/tags/v0.1.1.tar.gz"
      sha256 "8971382c0401b94e47d4a927d7603ff378b60428eb725ad3490509b60a3a0ba4"
      depends_on "rust" => :build
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/LLawli/note/releases/download/v0.1.1/note-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2031cfbb14965a5d81204c9d673665e59b45ebd141a4620efd8e42708f54ac22"
    end
    on_arm do
      url "https://github.com/LLawli/note/releases/download/v0.1.1/note-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3163970489e869fcc230cba209b08e6518b3a8acfac22ca00d108c39afa261dd"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      system "cargo", "install", *std_cargo_args(path: "crates/note-cli")
    else
      bin.install "note"
    end
  end

  test do
    assert_match "note", shell_output("#{bin}/note --version")
  end
end
