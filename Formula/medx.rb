class Medx < Formula
  desc "CLI e servidor MCP para a MedX, sistema de gestão de clínicas"
  homepage "https://github.com/LLawli/medx-sdk-oss"
  version "0.2.0"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/LLawli/medx-sdk-oss/releases/download/v0.2.0/medx-aarch64-apple-darwin.tar.gz"
      sha256 "7793d518ea5f4bf08f4ef8bb1e25df2050419181feafc7a3f0610b90c0e6fc28"
    end
    on_intel do
      url "https://github.com/LLawli/medx-sdk-oss/releases/download/v0.2.0/medx-x86_64-apple-darwin.tar.gz"
      sha256 "6c891747dc05010933ab4fe2582278d95827b567a16890f68781d2dd2168b740"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/LLawli/medx-sdk-oss/releases/download/v0.2.0/medx-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5008d9bf6f333642bb6a98505ae2c0b57496d96dd38d1a08645ad70ab71ef078"
    end
    on_intel do
      url "https://github.com/LLawli/medx-sdk-oss/releases/download/v0.2.0/medx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "760e5bfd1d1599bd7b31a8d7196c60111fa5b7e082f8cc3f7bb2f26e040af156"
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
