# -*- coding: utf-8 -*-
require "net/http"
require "uri"

uri = URI.parse("http://localhost/php/research/download.php");
Net::HTTP.start(uri.host, uri.port){|http|
  #ヘッダー部
  header = {
    "user-agent" => "Ruby/#{RUBY_VERSION} MyHttpClient"
  }
  #ボディ部
  body = "id=1&name=name"
  #送信
  response = http.post(uri.path, body, header)
  p response
  #p response.body
}
