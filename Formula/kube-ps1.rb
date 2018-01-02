class KubePs1 < Formula
  desc "Kubernetes prompt info for bash and zsh"
  homepage "https://github.com/jonmosco/kube-ps1"
  url "https://github.com/jonmosco/kube-ps1/archive/0.1.0.tar.gz"
  sha256 "fdff921bcc37417070f18d05c2173b8fae7bbb79daa3d35ad5cda4b9394067eb"
  head "https://github.com/jonmosco/kube-ps1"

  bottle :unneeded

  depends_on "kubernetes-cli" => :recommended

  def install
    prefix.install "kube-ps1.sh", "README.md"
  end

  def caveats; <<~EOS
    Make sure kube-ps1 is loaded from your ~/.zshrc or ~/.bashrc:
      For zsh:
      source "#{opt_prefix}/kube-ps1.sh"
      PROMPT='$(kube_ps1) $PROMPT'

      For Bash:
      source "#{opt_prefix}/kube-ps1.sh"
      PS1='[\\u@\h \W\[$(kube_ps1)\]]\$ $PS1'
    EOS
  end

  test do
    # Test that the file exists
    assert_predicate testpath/"#{opt_prefix}/kube-ps1.sh", :exist?
  end
end
