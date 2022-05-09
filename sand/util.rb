module Sand
  class Util

    def self.neighbour_points(box, p)
      neighbours = []
      
      if !box.contains_point?(p)
        raise "Point is outside sandbox"
      end

      surrounding_points(p).each do |sp|
        if(box.contains_point?(sp))
          neighbours.push(sp)
        end
      end

      return neighbours
    end

    def self.surrounding_points(p)
      return [
        Sand::Point.new(p.x, p.y-1),
        Sand::Point.new(p.x, p.y+1),
        Sand::Point.new(p.x-1, p.y),
        Sand::Point.new(p.x+1, p.y)
      ]
    end

  end
end