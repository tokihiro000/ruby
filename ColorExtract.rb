require 'rubygems'
require 'opencv'
include OpenCV


image = IplImage.load("sample.jpg")
#image2 = CvMat.load("sample.jpg", CV_LOAD_IMAGE_COLOR)
point = CvPoint.new(50, 50)
#hsv = OpenCV::RGB2HSV(image)

puts image

im_w = image.width
im_h = image.height

im_w.times do |x|
  im_h.times do |y|
    if y % 100 == 0
      pixel = image[y, x]
      blue, green, red = pixel[0], pixel[1], pixel[2]
      print "[", x, ",", y, "]  ", "blue = ", blue, ", green = ", green, ", red = ", red, "\n"
    end
  end
end



