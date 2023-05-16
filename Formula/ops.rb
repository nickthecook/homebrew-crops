# put this in /opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula/ops.rb
class Ops < Formula
  desc "Lightweight automation for your project"
  homepage "https://github.com/nickthecook/crops"
  url "https://github.com/nickthecook/crops/archive/refs/tags/2.0.2.tar.gz"
  sha256 "1a03447131174e722cfa142a87ec9eb6621612aba0c27923b439058eaba17bb1"
  license "GPL-3.0-only"

  depends_on "crystal" => :build
  depends_on "bdw-gc"
  depends_on "libevent"
  depends_on "libyaml"
  depends_on "pcre2"

  def install
    local_crystal_path = `crystal env CRYSTAL_PATH`.chomp
    system("CRYSTAL_PATH='src:lib:#{local_crystal_path}' crystal build -o ops ops.cr")
    bin.install "ops"
  end

  test do
    system "#{bin}/ops", "version"
  end
end
