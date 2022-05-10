module Sand
  class Gravity
    
    # maxSlope is the required difference between two neighbours sand heights
    # for sand to flow from the higher to the lower cell
    # 2 would be the lowest since a difference of 1 would just move one sand over,
    # reversing which cell is the highest.
    def self.apply(sandbox, max_slope=2)
      high_cells = get_high_cells(sandbox, max_slope)

      while high_cells.size > 0 do
        cell = set_pop(high_cells)
        apply_to_cell(sandbox, cell, high_cells)
      end

    end

    # returns a set of cells that have sand higher than their neighbours
    def self.get_high_cells(box, max_slope = 2)
      high_cells = Set.new

      box.each do |cell|
        #get neighbour cells of cell. If any are lower add cell to set
        neighbours = box.get_neighbour_cells(cell)
        neighbours.each do |neighbour|
          if(cell.height - neighbour.height > max_slope)
            high_cells << cell
            break
          end
        end
      end
      return high_cells
    end

    def apply_to_cell(sandbox, cell, high_cells)
      sandbox.get





    end

    # This pops an element off a set. Ruby doesn't let you take an element from a set
    # normally because Rubuy is dumb.
    def self.set_pop(set)
      element = nil
      set.each do |e|
        element = e
        set.delete(e)
        break
      end
      return element
    end

  end
end