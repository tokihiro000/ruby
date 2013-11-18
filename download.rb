require 'net/http'
require 'uri'
Net::HTTP.version_1_2

uri  = URI("http://localhost/php/file_dir/neko.png")
dest = "/Users/tokihiro/ruby/file/foo.png"

Net::HTTP.start(uri.host, uri.port) do |http|
	req = Net::HTTP::Get.new(uri.request_uri)
	#req.basic_auth 'tsun', 'dere'

	http.request(req) do |response|
		size = response["Content-Length"].to_f
		File.open(dest, "wb") do |file|
			response.read_body do |data|
				file.write data
				puts file.tell / size
			end
		end
	end
end
