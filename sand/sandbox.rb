Dir["./*.rb"].each {|file| require file }

module Sand
  class Sandbox

    attr_accessor :cells, :width, :height

    def initialize(width, height, initialHeight = 50)
      if width < 1 || height < 1
        raise "A sandbox must have at least one column and row."
      end
      
      @width = width
      @height = height

      @cells = Array.new(height) {Array.new(width){Sand::Cell.new(initialHeight, -1)}}
    end

    def contains_point?(p)
      return p.x >= 0 && p.x <= width && p.y >= 0 && p.y < height
    end

    def each
      @cells.each do |row|
        row.each do |column|
          yield column
        end
      end
    end

  end
end