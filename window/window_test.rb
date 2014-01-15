# -*- coding: utf-8 -*-
require 'rubygems'
require 'opencv'
include OpenCV

# 画像をロード
img = IplImage.load('sample.jpg')

window = GUI::Window.new('Face Detection')
window.show(img)
GUI::wait_key
