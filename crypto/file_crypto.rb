# -*- coding: utf-8 -*-
=begin

ファイルの暗号化

=end

require 'openssl'
require './create_key'

class File_Crypto

  def initialize(key = nil, iv = nil, alg = "aes-128-cbc")
    @cip = OpenSSL::Cipher.new(alg)
    @key = key
    @iv = iv
  end

  def file_encrypt(filepath)
    if @key != nil && @iv != nil
      @cip.encrypt #暗号化モード
      @cip.key = @key #鍵セット
      @cip.iv = @iv #イニシャライズベクタセット
      @cip.padding = 1 #パディング有効
      enc_data = ""
      File.open(filepath){|f|
      while data = f.read(1024)
        enc_data << @cip.update(data)
      end
      }
      enc_data << @cip.final
      return enc_data
    else
      return nil
    end
  end

  def file_decrypt(filepath)
    if @key != nil && @iv != nil
      @cip.decrypt #復号モード
      @cip.key = @key #鍵セット
      @cip.iv = @iv #イニシャライズベクタセット
      @cip.padding = 1 #パディング有効
      dec_data = ""
      File.open(filepath){|f|
      while data = f.read(1024)
        dec_data << @cip.update(data)
      end
      }
      dec_data << @cip.final
      return dec_data
    else
      return nil
    end
  end

end


#このプログラムが単体で実行される場合のみ以下を実行
if __FILE__ == $0
  filepath = ARGV[0]
  ck = Create_key.new("aes-128-cbc")
  key = ck.key_gen
  iv = ck.iv_gen

  c = File_Crypto.new(key, iv, "aes-128-cbc")
  cipherdata = c.file_encrypt(filepath)
  if cipherdata != nil
    File.binwrite("Enc1", cipherdata);
    b = c.file_decrypt("./Enc1")
    File.write("hoge.txt", b);
  else
    print "error\n"
  end
end
