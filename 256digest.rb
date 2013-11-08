# -*- coding: ascii-8bit -*-
require 'openssl'

def make_sha256(str)
  dig256 = OpenSSL::Digest::SHA256.new()  
  return dig256.hexdigest(str)  
end


if __FILE__ == $0
  plaintext = ARGV[0]
  digest_text = make_sha256(plaintext)
  puts digest_text
end
