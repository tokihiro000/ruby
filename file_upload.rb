# -*- coding: utf-8 -*-
require "net/http"
require "uri"

uri = URI.parse("http://localhost/php/test_up.php");
Net::HTTP.start(uri.host, uri.port){|http|

  #リクエストインスタンス生成
  request = Net::HTTP::Post.new(uri.path)

  #ヘッダー部
  request["user-agent"] = "Ruby/#{RUBY_VERSION} MyHttpClient"
  #request.set_content_type("multipart/form-data; boundary=myboundary")
  #（以下でも可）
  request["content-type"] = "multipart/form-data; boundary=myboundary"
  
  #ボディ部
  #multipart/form-dataの仕様にあわせてbodyを作成
  body = ""
  body.concat("--myboundary\r\n")
  body.concat("content-disposition: form-data; name=\"id\";\r\n")
  body.concat("\r\n")
  body.concat("1\r\n")

  body.concat("--myboundary\r\n")
  body.concat("content-disposition: form-data; name=\"file1\"; filename=\"sample.txt\"\r\n")
  body.concat("\r\n")
  File::open("./str1.rb"){|f| body.concat(f.read + "\r\n") }
=begin
  body.concat("--myboundary\r\n")
  body.concat("content-disposition: form-data; name=\"file2\"; filename=\"sample.jpg\"\r\n")
  body.concat("\r\n")
  File::open("/Users/tokihiro/ruby/sample.jpg"){|f| body.concat(f.read + "\r\n") }
=end
  body.concat("--myboundary--\r\n")
  request.body = body
  
  #送信
  response = http.request(request)
  
  p response
  p response.body
}
