Dir["./*.rb"].each {|file| require file }

module Sand
  class Point

    attr_accessor :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end
  end
end