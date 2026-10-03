class Medx < Formula
  desc "CLI e servidor MCP para a MedX, sistema de gestão de clínicas"
  homepage "https://github.com/LLawli/medx-sdk-oss"
  version "0.1.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/LLawli/medx-sdk-oss/releases/download/v0.1.0/medx-aarch64-apple-darwin.tar.gz"
      sha256 "c66e4dcddc9f025ea457a16a9ff7b0881b85d8f827393ad072f8e38c0b2a8d0e"
    end
    on_intel do
      url "https://github.com/LLawli/medx-sdk-oss/releases/download/v0.1.0/medx-x86_64-apple-darwin.tar.gz"
      sha256 "a6beee9fa4b085936652c708b0d053a7fd8b6fabd09fcdb8cbb901e61fbaa0de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/LLawli/medx-sdk-oss/releases/download/v0.1.0/medx-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5873696efebeb8808af55f92efc2627145a09a715849d7ac2fa1428d509f4b8b"
    end
    on_intel do
      url "https://github.com/LLawli/medx-sdk-oss/releases/download/v0.1.0/medx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "617143bfd2897e6503689a54f86bdfd4922891f232379ea53d58845474064cc5"
    end
  end

  def install
    bin.install "medx-cli", "medx-mcp"
  end

  def caveats
    <<~EOS
      Para usar o servidor MCP no Claude Code:
        claude mcp add medx -s user \\
          -e MEDX_LOGIN_CREDENTIAL=voce@clinica.com.br \\
          -e MEDX_PASSWORD_CREDENTIAL='senha' \\
          -- medx-mcp
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/medx-cli version")
    # Configuração inválida: o servidor sai com 2 antes de abrir o stdio.
    assert_match "MEDX_MCP_ALLOW_WRITE",
      shell_output("MEDX_MCP_ALLOW_WRITE=talvez #{bin}/medx-mcp 2>&1", 2)
  end
end
