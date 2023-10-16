class NodeBuild < Formula
  desc "Install NodeJS versions"
  homepage "https://github.com/nodenv/node-build"
  url "https://github.com/nodenv/node-build/archive/v4.9.127.tar.gz"
  sha256 "c4c8b3960c1b13bb41fe96a24c54b9b994c3d100047ef1eb2c26830026281a48"
  license "MIT"
  head "https://github.com/nodenv/node-build.git", branch: "master"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle do
    sha256 cellar: :any_skip_relocation, all: "0f69e614e07f45a32854fd1afe1a69a13697d6abbc742cbc01f3f0ac24936be7"
  end

  depends_on "autoconf"
  depends_on "openssl@3"
  depends_on "pkg-config"

  def install
    ENV["PREFIX"] = prefix
    system "./install.sh"
  end

  test do
    system "#{bin}/node-build", "--definitions"
  end
end
