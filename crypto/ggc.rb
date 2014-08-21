# -*- coding: utf-8 -*-
load("rsa_crypto.rb")
def GenGeneratorClient(rsa_pri_key, origin_hash,  gen_counter, padding)
  # 起源となるキーワードハッシュとパディング値を連結したデータを平文としてRSA暗号文を取得する
  rawData = padding + origin_hash
  encData = rsa_private_encrypt(rawData, rsa_pri_key, OpenSSL::PKey::RSA::NO_PADDING)

  if(encData == nil)
    printf("GenGeneratorClient RSA_private_encrypt error1\n")
    nil
  end

  # 世代が２世代の場合、上記で計算した暗号文を返す
  if(gen_counter == 2)
      encData
  end

  # それ以外の世代の場合、世代分の暗号化を繰り返す。
  rawData = encData
  (gen_counter - 2).times do
    encData = rsa_private_encrypt(rawData, rsa_pri_key, OpenSSL::PKey::RSA::NO_PADDING)

    if(encData == nil)
      printf("GenGeneratorClient RSA_private_encrypt error2\n")
      return nil
    end
    rawData = encData
  end

  return encData
end

if __FILE__ == $0
  load("256digest.rb")
  private_key = File.read 'privateKey.pem'
  padding = File.read 'padding.txt'
  plaintext = ARGV[0]

  digest_message = make_sha256(plaintext)
  encData = GenGeneratorClient(private_key, digest_message.force_encoding('utf-8'), 4, padding.force_encoding('utf-8'))
  new_generetion_digest = make_sha256(encData)
  bin_dump(new_generetion_digest)
end
