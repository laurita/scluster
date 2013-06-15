module SCluster

  class Cluster
    attr_accessor :points

    def initialize(points)
      @points = points
    end

    def distance_to(cluster)
      distances = @points.product(cluster.points).collect do |a, b|
        a.distance_to(b)
      end

      return distances.inject(:+) / distances.size
    end

    def merge(cluster)
      return Cluster.new(@points + cluster.points)
    end

    def to_s
      return @points.join(', ')
    end

    def to_a
      return @points.collect { |p| p.point }
    end
  end

end
