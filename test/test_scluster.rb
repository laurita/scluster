require 'test/unit'
require 'set'
require 'scluster'

class SClusterTest < Test::Unit::TestCase
  def test_cluster
    points = [
      {:val => "foobar1"},
      {:val => "foobar2"},
      {:val => "barfoo3"},
      {:val => "barfoo42"},
      {:val => "other"}
    ]
    max_distance = 0.5
    clusterer = SCluster::Clusterer.new(points, max_distance)
    clusterer.cluster

    expected = [
      [{:val => "other"}],
      [{:val => "foobar1"}, {:val => "foobar2"}],
      [{:val => "barfoo3"}, {:val => "barfoo42"}]
    ]    
    assert_equal expected, clusterer.to_a
  end
end
