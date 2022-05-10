module Sand
  class Cell

    attr_accessor :limit, :height, :location

    # height is how much sand is in the cell
    # limit is the maximum amount of sand that will remain after the sandbox is in equilibrium
    # If limit is negative it won't be applied. (There should be a way to turn it off.
    # This might be a bad way to do it.)
    def initialize(height, limit)
      # if limit < 0
      #  raise "limit is lower than 0"
      # end
      if height < 0
        raise "height is lower than 0"
      end
      
      @height = height
      @limit = limit
    end

    def full?
      return (limit >= 0) && (height >= limit)
    end

  end
end