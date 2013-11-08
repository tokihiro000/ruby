# -*- coding: utf-8 -*-
require 'openssl'
require './create_key'

class HmacClass

  def initialize(key, digest = "sha256")
    @hmac = OpenSSL::HMAC.new(key, digest)
  end

  #文字列のメッセージ認証コード
  def HmacStringDigest(str)
    @hmac.update(str)
    return @hmac.hexdigest
  end

  #ファイルのメッセージ認証コード
  def HmacFileDigest(filename)
    File.open(filename){|f|
      while data = f.read(1024)
        @hmac.update(data)
      end
    }
    return @hmac.hexdigest
  end

end

#このプログラムが単体で実行される場合のみ以下を実行
if __FILE__ == $0
  plaintext = ARGV[0]
  ck = Create_key.new("AES-256-CBC")
  key = ck.key_gen
  hm = HmacClass.new("pass", "sha256")
  digest_text = hm.HmacStringDigest(plaintext)
  file_digest_text = hm.HmacFileDigest("music.mp3")
  puts digest_text
  puts file_digest_text
end
