# -*- coding: utf-8 -*-
require 'rubygems'
require 'zip'

#zipを作るフォルダ(.なのでカレントディレクトリ)
folder = "."
#
input_filenames = ['image.jpg', 'test.txt']

zipfile_name = "./zip_dir/archive.zip"

Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
  input_filenames.each do |filename|
    # Two arguments:
    # - The name of the file as it will appear in the archive
    # - The original file, including the path to find it
    zipfile.add(filename, folder + '/' + filename)
  end
end
