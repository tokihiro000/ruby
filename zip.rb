# -*- coding: utf-8 -*-
require 'rubygems'
require 'zip'

folder = "/Users/tokihiro"
input_filenames = ['image.jpg', 'test.txt']

zipfile_name = "/Users/tokihiro/zip_folder/archive.zip"

Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
  input_filenames.each do |filename|
    # Two arguments:
    # - The name of the file as it will appear in the archive
    # - The original file, including the path to find it
    zipfile.add(filename, folder + '/' + filename)
  end
end
