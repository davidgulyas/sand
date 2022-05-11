require 'chunky_png'

module Draw
  class WritePng

    def self.create_png_from_sandbox(box, filename = 'filename.png')
      png = ChunkyPNG::Image.new(box.width, box.height, ChunkyPNG::Color::TRANSPARENT)

      min_sand, max_sand = box.get_extremes

      (0...box.height).each do |y|
        (0...box.width).each do |x|
          scaled_color = scale_value(min_sand, max_sand, box.cells[y][x].height)
          png[x,y] = ChunkyPNG::Color.rgb(scaled_color, scaled_color, scaled_color)

        end
      end
      png.save(filename, :interlace => true)
      return
    end

    # Takes a range and a value within that range and translated it to a proportional value
    # in the grey scale range of 0..255
    def self.scale_value(from_min, from_max, value)
      to_min = 0
      to_max = 255

      value = value - from_min
      value = value / (from_max - from_min).to_f
      (value * 255).round
    end
  end
end