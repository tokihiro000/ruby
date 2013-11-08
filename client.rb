require 'multipart'

url = URI.parse('http://localhost/php/test_up.php');
File.open("./sample.jpg") do |jpg|
  req = Net::HTTP::Post::Multipart.new url.path,
    "file" => UploadIO.new(jpg, "image/jpeg", "sample.jpg")
  res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req)
  end
end
