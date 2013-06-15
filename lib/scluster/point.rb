require 'levenshtein'

# Point.new({:group => "blah", :name => "121231 Mc Donald's", :val => "Mc Donalds"})

module SCluster

  class Point
    attr_accessor :point
    attr_accessor :val

    def initialize(point)
      @point = point
      @val = point[:val]
    end

    def length
      return @val.length
    end

    def <=>(point)
      cmp = @val <=> point.val
      cmp = @object_id <=> point.object_id if cmp == 0
      return cmp
    end

    def distance_to(point)
      dist = Levenshtein.distance(@val, point.val)
      weight = [@val.length, point.val.length].max
      dist = dist / Float(weight)

      return dist
    end

    def to_s
      "(#{point})"
    end
  end

end
