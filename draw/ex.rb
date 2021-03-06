require 'chunky_png'

def test
  # Creating an image from scratch, save as an interlaced PNG
  png = ChunkyPNG::Image.new(16, 16, ChunkyPNG::Color::TRANSPARENT)
  png[1,1] = ChunkyPNG::Color.rgba(10, 20, 30, 128)
  png[2,1] = ChunkyPNG::Color('black @ 1.0')
  png.save('filename.png', :interlace => true)
end