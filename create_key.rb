# -*- coding: utf-8 -*-
require 'openssl'

def bin_dump(str, num)
  num.times do |i|
    str[i].bytes { |b| print b.to_s(16) }
  end
  puts ""
end

class Create_key

  def initialize(alg)
    @cip = OpenSSL::Cipher.new(alg)
    OpenSSL::Random.load_random_file("/dev/random")
  end

  #乱数シード変更
  def ch_seed
    OpenSSL::Random.load_random_file("/dev/random")
  end

  #イニシャライズベクタ生成
  def iv_gen
    return @cip.random_iv
  end

  #鍵生成
  def key_gen
    return @cip.random_key
  end

  #鍵長を返す
  def key_len
    return @cip.key_len
  end
end

if __FILE__ == $0
  ck = Create_key.new("aes-256-cbc")
  key = ck.key_gen
  len = ck.key_len
  print "len = ", len, "\n"
  bin_dump(key, len)
end
