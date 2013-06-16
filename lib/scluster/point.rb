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

    # Calculates Levenshtein distance between two points,
    # weighted by the length of the longer string.
    # Levenshtein distance is string edit distance - the
    # number of string edit operations to make two strings equal.
    # * *Args*    :
    #   - +point+ -> Point instance having string in
    #                :val
    # * *Returns* :
    #   - Float distance in [0, 1] range 
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
