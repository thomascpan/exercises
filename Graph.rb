# Graph - A graph 'G' is an ordered pair of a set 'V' of vertices and a set 'E' of edges.
# G = (V,E)
# Adjacency List Implementation
class Graph
  attr_accessor :vertices

  def initialize
    @vertices_map = {}
    @vertices = []
  end

  def insert(v1,v2)
    [v1,v2].each do |v|
      index = @vertices_map[v]

      if index.nil?
        @vertices_map[v] = @vertices_map.length
        @vertices[@vertices_map[v]] = []
      end
    end

    @vertices[@vertices_map[v1]] << @vertices_map[v2]
    @vertices[@vertices_map[v2]] << @vertices_map[v1]
  end

  def delete(v1,v2)
    i1 = @vertices_map[v1]
    i2 = @vertices_map[v2]

    return nil if i1.nil? || i2.nil?

    @vertices[i1].delete(i2)
    @vertices[i2].delete(i1)
  end

  def find(v1,v2)
    i1 = @vertices_map[v1]
    i2 = @vertices_map[v2]

    return false if i1.nil? || i2.nil?

    return @vertices[i1].include?(i2)
  end

  def adjacent_vertices(v1)
    i1 = @vertices_map[v1]

    return nil if i1.nil?

    @vertices[i1].each do |v|
      print "#{@vertices_map.key(v)} "
    end
    puts
  end

  def print_values
    @vertices.each_with_index do |v, i|
      v.each do |e|
        print "[#{@vertices_map.key(i)}, #{@vertices_map.key(e)}] "
      end
    end
    puts
  end
end

g = Graph.new

g.insert("A", "B")
g.insert("A", "C")
g.insert("A", "D")
g.insert("B", "E")
g.insert("B", "F")
g.insert("C", "G")
g.insert("D", "H")
g.insert("E", "H")
g.insert("F", "H")
g.insert("G", "H")

g.print_values

p g.find("A", "B")

g.delete("A", "B")

p g.find("A", "B")

g.print_values

g.adjacent_vertices("H")