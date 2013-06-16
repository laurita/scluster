module SCluster

  class Cluster
    attr_accessor :points

    def initialize(points)
      @points = points
    end
    
    # Calculates distance between two clusters,
    # which is the average of weighted Levenshtein
    # distances between all points in different groups.
    # * *Args*    :
    #   - +cluster+ -> Cluster instance
    # * *Returns* :
    #   - Float distance in [0, 1] range 
    def distance_to(cluster)
      distances = @points.product(cluster.points).collect do |a, b|
        a.distance_to(b)
      end

      return distances.inject(:+) / distances.size
    end

    # Merges two clusters into one.
    # * *Args*    :
    #   - +cluster+ -> Cluster instance
    # * *Returns* :
    #   - Cluster instance
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
