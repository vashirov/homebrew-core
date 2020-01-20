class Sxiv < Formula
  desc "Simple X Image Viewer"
  homepage "https://github.com/muennich/sxiv"
  url "https://github.com/muennich/sxiv/archive/v26.tar.gz"
  sha256 "a382ad57734243818e828ba161fc0357b48d8f3a7f8c29cac183492b46b58949"
  head "https://github.com/muennich/sxiv.git"

  bottle do
    cellar :any
    sha256 "4fc8ef0f71f9cc26c8d685915c12f34147941f57a0d5cef118d0bc681907b5a4" => :catalina
    sha256 "14d41d161fe07716d411db619a508bbdf6ba8f679dbcedbe349545a2e199bc5e" => :mojave
    sha256 "f34e137e297f708018be69bdb6c355a9f86ff9fc0cf630560a7922c2224e71b4" => :high_sierra
  end

  depends_on "giflib"
  depends_on "imlib2"
  depends_on "libexif"
  depends_on :x11

  def install
    system "make", "PREFIX=#{prefix}", "AUTORELOAD=nop", "CPPFLAGS=-I/opt/X11/include", "LDFLAGS=-L/opt/X11/lib", "LDLIBS=-lpthread", "install"
  end

  test do
    system "#{bin}/sxiv", "-v"
  end
end
