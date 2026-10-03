class Medx < Formula
  desc "CLI e servidor MCP para a MedX, sistema de gestão de clínicas"
  homepage "https://github.com/LLawli/medx-sdk-oss"
  version "0.1.1"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/LLawli/medx-sdk-oss/releases/download/v0.1.1/medx-aarch64-apple-darwin.tar.gz"
      sha256 "95289d39abc6ce0d7fe10e77126f4ca7a9f5d743345cc90b70f5b93930a5329e"
    end
    on_intel do
      url "https://github.com/LLawli/medx-sdk-oss/releases/download/v0.1.1/medx-x86_64-apple-darwin.tar.gz"
      sha256 "d8a850e7935c056090fa4ed6343ad491dfcfc100c41a5ce84094c531fd8b6e4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/LLawli/medx-sdk-oss/releases/download/v0.1.1/medx-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b7f4cbd1121e59c7e1e2bb1fd4c7b40f8c5957d2f1dd49c84fb6a233c1c365c2"
    end
    on_intel do
      url "https://github.com/LLawli/medx-sdk-oss/releases/download/v0.1.1/medx-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d4ec9dbb53fb1e6cea60d4ce7cb1ab2a9470d2414e2d7ef9b990068eb1071da0"
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
