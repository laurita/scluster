module SCluster

  class Clusterer
    attr_accessor :points

    def initialize(points, max_distance)
      # Preclustering optimization: gathers all the points
      # having the same (cleaned) name into one cluster.
      points = points.group_by { |p| p[:val] }.values
      @clusters = points.collect{ |point|
        Cluster.new(point.collect{ |p| Point.new(p) }) }
      @max_distance = max_distance
    end

    # Merges the two closest clusters until the smallest
    # distance is not bigger that the given threshold.
    def cluster
      closest_distance = 0
      while closest_distance < @max_distance
        closest_distance, c1, c2 = find_closest_distance

        if closest_distance < @max_distance
          merge(c1, c2)
        end
      end
    end

    # Finds two clusters having the smallest distance.
    # * *Returns* :
    #   - distance, and the two closest clusters
    def find_closest_distance
      closest_distance = 1
      closest_clusters = [nil, nil]

      @clusters.combination(2) do |c|
        dist = c[0].distance_to(c[1])
        if  dist < closest_distance
          closest_distance = dist
          closest_clusters = [c[0], c[1]]
        end
      end

      return closest_distance, closest_clusters[0], closest_clusters[1]
    end

    # Merges two clusters.
    # * *Args*    :
    #   - +c1+    -> Cluster instance
    #   - +c2+    -> Cluster instance
    # * *Returns* :
    #   - one merged cluster
    def merge(c1, c2)
      clusters = @clusters.dup
      @clusters = clusters - [c1, c2] + [c1.merge(c2)]
    end

    def to_s
      return @clusters.join("\n")
    end

    def to_a
      return @clusters.collect { |c| c.to_a }
    end
  end

end
