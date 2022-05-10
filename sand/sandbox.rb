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

      # cells can be accessed with @cells[y][x]. y is how far down from the top the cell is.
      # x is how far right from the left side the cell is.
      # because arrays are 0 indexed, @cells[height][width] will return nil since it's
      # beyond the bounds of the arrray.
      @cells = Array.new(height) {Array.new(width){Sand::Cell.new(initialHeight, -1)}}

      (0...@height).each do |y|
        (0...@width).each do |x|
          p = Sand::Point.new(x,y)
          cell_at(p).location = p
        end
      end
    end

    def contains_point?(p)
      return p.x >= 0 && p.x < width && p.y >= 0 && p.y < height
    end

    def each
      @cells.each do |row|
        row.each do |cell|
          yield cell
        end
      end
    end

    # returns the min and max amounts of sand in the box
    def get_extremes
      min = cells[0][0].height
      max = cells[0][0].height
      self.each do |cell|
        if cell.height < min
          min = cell.height
        end

        if cell.height > max
          max = cell.height
        end
      end
      return min, max
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

    def cell_at(p)
      @cells[p.y][p.x]
    end

    def get_neighbour_cells(cell)
      cell_location = cell.location
      neighbour_points = surrounding_points(cell_location)

      neighbour_cells = []
      neighbour_points.each do |p|
        if(contains_point?(p))
          neighbour_cells.push(cell_at(p))
        end
      end
      return neighbour_cells
    end

    def surrounding_points(p)
      return [
        Sand::Point.new(p.x, p.y-1),
        Sand::Point.new(p.x, p.y+1),
        Sand::Point.new(p.x-1, p.y),
        Sand::Point.new(p.x+1, p.y)
      ]
    end
  end
end