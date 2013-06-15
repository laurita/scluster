require 'test/unit'
require 'set'
require 'scluster'

class SClusterTest < Test::Unit::TestCase
  def test_cluster
    points = ["foobar1", "foobar2", "barfoo3", "barfoo42", "other"]
    max_distance = 0.5
    clusterer = SCluster::Clusterer.new(points, max_distance)
    clusterer.cluster

    expected = [["other"], ["foobar1", "foobar2"], ["barfoo3", "barfoo42"]]
    assert_equal expected.sort, clusterer.to_a.sort
  end
end
