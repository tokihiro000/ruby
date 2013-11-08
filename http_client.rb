# -*- coding: utf-8 -*-
require 'rubygems'
require 'httpclient'

boundary = "123456"
c = HTTPClient.new
open("/Users/tokihiro/Pictures/moon.jpg", "r") do |file|
  postdata = { "tmp_name" => "michael", "name" => "jackson", "upfile" => file }
  puts c.post_content("http://localhost/php/upload.php", postdata, "content-type" => "multipart/form-data, boundary=#{boundary}")
end
