require 'levenshtein'

module SCluster

  class Point
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def length
      return @name.length
    end

    def <=>(point)
      cmp = @name <=> point.name
      cmp = @object_id <=> point.object_id if cmp == 0
      return cmp
    end

    def distance_to(point)
      dist = Levenshtein.distance(self.name, point.name)
      weight = [self.name.length, point.name.length].max
      dist = dist / Float(weight)

      return dist
    end

    def to_s
      "(#{name})"
    end
  end

end
