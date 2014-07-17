# -*- coding: utf-8 -*-
=begin

文字列の暗号化と復号を行うメソッド。ふい文字かわいすぎてやゔぁい！

=end

require 'openssl'
require './create_key'

def bin_dump(str, num)
  num.times do |i|
    str[i].bytes { |b| print b.to_s(16) }
  end
  puts ""
end

class Crypto

  def initialize(key = nil, iv = nil, alg = "aes-128-cbc")
    @cip = OpenSSL::Cipher.new(alg)
    @key = key
    @iv = iv
  end

  def encrypt(s)
    if @key != nil && @iv != nil
      @cip.encrypt #暗号化モード
      @cip.key = @key #鍵セット
      @cip.iv = @iv #イニシャライズベクタセット
      @cip.padding = 1 #パディング有効
      enc_data = ""
      enc_data << @cip.update(s)
      enc_data << @cip.final
      return enc_data
    else
      return nil
    end
  end

  def decrypt(s)
    if @key != nil && @iv != nil
      @cip.decrypt #復号モード
      @cip.key = @key #鍵セット
      @cip.iv = @iv #イニシャライズベクタセット
      @cip.padding = 1 #パディング有効
      dec_data = ""
      dec_data << @cip.update(s)
      dec_data << @cip.final
      return dec_data
    else
      return nil
    end
  end

end


#このプログラムが単体で実行される場合のみ以下を実行
if __FILE__ == $0
  plaintext = ARGV[0]

  ck = Create_key.new("aes-128-cbc")
  key = ck.key_gen
  iv = ck.iv_gen

  c = Crypto.new(key, iv, "aes-128-cbc")
  ciphertext = c.encrypt(plaintext)
  if ciphertext != nil
    print "[ciphertext] : "
    bin_dump(ciphertext, 16)
    b = c.decrypt(ciphertext)
    p b
  else
    print "error\n"
  end
end
