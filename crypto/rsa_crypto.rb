# -*- coding: utf-8 -*-
require 'openssl'
load("bin_dump.rb")

def rsa_public_encrypt str, public_key, padding
  rsa_pub = OpenSSL::PKey::RSA.new public_key
  enc_text = rsa_pub.public_encrypt(str, padding)
  enc_text
end

def rsa_private_decrypt enc_text, private_key, padding
  rsa_pri = OpenSSL::PKey::RSA.new private_key
  dec_text = rsa_pri.private_decrypt(enc_text, padding)
  dec_text
end

def rsa_private_encrypt str, private_key, padding
  rsa_pri = OpenSSL::PKey::RSA.new private_key
  enc_text = rsa_pri.private_encrypt(str, padding)
  enc_text
end

def rsa_public_decrypt enc_text, public_key, padding
  rsa_pub = OpenSSL::PKey::RSA.new public_key
  dec_text = rsa_pub.public_decrypt(enc_text, padding)
  dec_text
end


if $0 == __FILE__
  str = ARGV[0]
  if str
    private_key = File.read 'privateKey.pem'
    public_key  = File.read 'publicKey.pem'
    enc_text = rsa_public_encrypt(str, public_key, OpenSSL::PKey::RSA::PKCS1_PADDING)
    bin_dump(enc_text, 1024)
    dec_text = rsa_private_decrypt(enc_text, private_key, OpenSSL::PKey::RSA::PKCS1_PADDING)
    puts dec_text
    enc_text2 = rsa_private_encrypt(str, private_key, OpenSSL::PKey::RSA::PKCS1_PADDING)
    dec_text2 = rsa_public_decrypt(enc_text2, public_key, OpenSSL::PKey::RSA::PKCS1_PADDING)
    puts dec_text2
  else
    puts "enter the text!"
  end
end
