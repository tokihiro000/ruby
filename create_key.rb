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
    OpenSSL::Random.load_random_file("/dev/random")
    @cip = OpenSSL::Cipher.new(alg)
  end

  #イニシャライズベクタ生成
  def iv_gen
    if OpenSSL::Random.status?
      return @cip.random_iv
    else
      puts "エントロピー不足"
      return nil
    end

  end

  #鍵生成
  def key_gen
    if OpenSSL::Random.status?
      return @cip.random_key
    else
      puts "エントロピー不足"
      return nil
    end
  end

  #鍵長を返す
  def key_len
    return @cip.key_len
  end
end

#このプログラムが単体で実行される場合のみ以下を実行
if __FILE__ == $0
  ck = Create_key.new("aes-256-cbc")
  key = ck.key_gen
  len = ck.key_len
  print "len = ", len, "\n"
  if key != nil
    bin_dump(key, len)
  end
end
