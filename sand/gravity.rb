module Sand
  class Gravity
    
    # maxSlope is the required difference between two neighbours sand heights
    # for sand to flow from the higher to the lower cell
    def self.apply(sandbox, maxSlope)


    end

    # returns a list of cells that have sand higher than their neighbours
    def get_high_cells(box, maxSlope)
      highCells = []

      box.each do |cell|
        #get neighbour cells of cell. If any are higher add cell to list
      end

    end

  end
end