# -*- coding: utf-8 -*-
c_file = ARGV[0]

re = /int|void|char|unsigned|double/
count = 0

File.open(c_file) do |io|  
  while line = io.gets
    if re =~ line            
      if !line.include?(";") #プロトタイプ宣言を削除
        count += 1
        line = line.delete("{")
        print count, " ", line
      end
    end
  end
end
