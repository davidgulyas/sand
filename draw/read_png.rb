require 'chunky_png'

module Draw
  class ReadPng

    def self.create_sandbox_from_png(filename = './images/test1.png')
      if(!File.exist? filename)
        raise "File:" + filename + " doesn't exist"
      end
      image = ChunkyPNG::Image.from_file(filename)
      box = Sand::Sandbox.new(image.height, image.width)

      (0...image.height).each do |y|
        (0...image.width).each do |x|
          box.cells[y][x].height = ChunkyPNG::Color.r(image[x,y])
        end
      end
      return box
    end

  end
end
 