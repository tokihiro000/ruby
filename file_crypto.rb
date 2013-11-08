# -*- coding: ascii-8bit -*-
require 'openssl'
require 'bin_dump.rb'

def encrypt(file, key, iv)
  enc = OpenSSL::Cipher::Cipher.new("aes-128-cbc") #128bitのAES暗号をCBCモードで使うインスタンス生成
  enc.encrypt                                      #暗号化モード
  enc.key = key
  enc.iv = iv  
  return enc.update(file) + enc.final                 #暗号化
end

def decrypt(file, key, iv)
  dec = OpenSSL::Cipher::Cipher.new("aes-128-cbc") #128bitのAES暗号をCBCモードで使うインスタンス生成
  dec.decrypt                                      #復号モード
  dec.key = key
  dec.iv = iv
  return dec.update(file) + dec.final                 #復号
end
 
if __FILE__ == $0                                  #このプログラムが単体で実行される場合のみ以下を実行
  plaintext = ARGV[0]
  io = File.open('k1.txt', 'rb')
  io2 = File.open('iv.txt', 'rb')  
  inFile = File.open(plaintext, 'rb');
  key = io.gets
  iv = io2.gets
  print "[key] : "
  bin_dump(key, 16)
  print "[iv] : "
  bin_dump(iv, 16)
  
  outFile = encrypt inFile, key, iv                     #__FILE__ と $0は他のプログラムにrequireされると一致しない。
  print "[ciphertext] : "
  bin_dump(ciphertext, 16)
  b = decrypt ciphertext, key, iv
  p b
end

