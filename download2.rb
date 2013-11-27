def save_file(url)
    filename = File.basename(url)
    open(filename, 'wb') do |file|
        open(url) do |data|
            file.write(data.read)
      end
    end
end

if __FILE__ == $0
  url = ARGV[0];
  save_file(url)
end
