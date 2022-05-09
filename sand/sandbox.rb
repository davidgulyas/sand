require './sand/cell.rb'

# When giving coordinates, the first is now many lines down, and the next is how many to the right.
# 0,0 is top left.

module Sand
  class Sandbox

    attr_accessor :cells, :width, :height

    def initialize(height, width, initialHeight = 50)
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
        row.each do |cell|
          yield cell
        end
      end
    end

    # returns the least and greatest amounts of sand in the box
    def get_extremes
      least = cells[0][0].height
      greatest = cells[0][0].height
      self.each do |cell|
        if cell.height < least
          least = cell.height
        end

        if cell.height > greatest
          greatest = cell.height
        end
      end
      return least, greatest
    end

    def print_box
      @cells.each do |row|
        row.each do |cell|
          print cell.height
          print ', '
        end
        puts ''
      end
      return
    end

  end
end