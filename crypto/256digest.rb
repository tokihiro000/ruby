# -*- coding: utf-8 -*-
require 'openssl'
load("bin_dump.rb")

def make_sha256(str)
  dig256 = OpenSSL::Digest::SHA256.new()
  return dig256.digest(str)
end


if __FILE__ == $0
  plaintext = ARGV[0]
  digest_text = make_sha256(plaintext)
  bin_dump(digest_text, 0)
end
