# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Regen < Formula
  desc "Regen generates objective-c code for accessing your images and localized string"
  homepage "https://github.com/idomizrachi/Regen"
  url "https://github.com/idomizrachi/Regen/archive/0.0.10.tar.gz"
  version "0.0.10"
  sha256 "25c0ed91b5996eb5f32466c5934a30c5716d36b286433a2b73624c20fd233cbf"
  head "https://github.com/idomizrachi/Regen.git"

  # depends_on "cmake" => :build
  depends_on :xcode => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    #system "./configure", "--disable-debug",
    #                      "--disable-dependency-tracking",
    #                      "--disable-silent-rules",
    #                      "--prefix=#{prefix}"
    # syste	m "cmake", ".", *std_cmake_args
    # system "make", "install" # if this fails, try separate make/make install steps
    xcodebuild "-target", "regen", "-configuration", "Release", "SYMROOT=symroot", "OBJROOT=objroot"
    bin.install "symroot/Release/regen"
  end



  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test Regen`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/regen", "--version"
    system "#{bin}/regen"
  end
end
