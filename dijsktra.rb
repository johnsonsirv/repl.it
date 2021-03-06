class PriorityQueue
  attr_reader :values
  def initialize
    @values = []
  end
  def enqueue(vertex, priority)
    @values << {vertex: vertex, priority: priority}
    @values.sort_by! { |a| a[:priority] }
  end
  def dequeue
    @values.shift
  end
end

def adjacency_list(matrix)
  weighted_hash_graph =  Hash.new
  stop = matrix.size - 1
  0.upto(stop) do |row|
    weighted_hash_graph[row] = []
    0.upto(stop) do |column|
      weighted_hash_graph[row] << {node: column, weight: matrix[row][column]} unless matrix[row][column].zero?
    end
  end
  weighted_hash_graph
end



def dijkstra(matrix, start, finish)
  weighted_hash_graph = adjacency_list(matrix)
  queue = PriorityQueue.new
  distances = []
  previous = []
  #inital state setup
  weighted_hash_graph.each_key do | vertex|
    if vertex.eql?(start)
      distances[vertex] = 0
      queue.enqueue(vertex, 0)
    else
      distances[vertex] = Float::INFINITY
      queue.enqueue(vertex, Float::INFINITY)
    end

    previous[vertex] = nil
  end
  
  #util queue is empty
  until queue.values.empty?
    current_smallest_node = queue.dequeue[:vertex]
    return distances if current_smallest_node.eql?(finish)
    weighted_hash_graph[current_smallest_node].each do |neighbour|
      neighbour_weight = neighbour[:weight]
      neighbour_vertex = neighbour[:node]
      dist = distances[current_smallest_node] + neighbour_weight
      if dist < distances[neighbour_vertex]
        distances[neighbour_vertex] = dist
        previous[neighbour_vertex] = current_smallest_node
        queue.enqueue(neighbour_vertex, dist)
      end
    end
  end
 
end


def shortest_path_wg(matrix)
  # write your code here
  dijkstra(matrix, 0, matrix.size - 1)
end

p shortest_path_wg([[0, 0, 1, 3, 0, 0], [0, 0, 0, 5, 0, 0], [1, 0, 0, 2, 1, 4], [3, 5, 2, 0, 7, 0], [0, 0, 1, 7, 0, 2], [0, 0, 4, 0, 2, 0]])
# => [0, 2, 1, 1, 2, 2]
# p shortest_path_wg([[0, 3, 6, 0, 0, 9, 4], [3, 0, 4, 1, 0, 0, 0], [6, 4, 0, 3, 5, 4, 1], [0, 1, 3, 0, 2, 0, 0], [0, 0, 5, 2, 0, 3, 0], [9, 0, 4, 0, 3, 0, 3], [4, 0, 1, 0, 0, 3, 0]])
# [0, 3, 5, 4, 6, 7, 4]

p shortest_path_wg([[0, 3, 5], [3, 0, 1], [5, 1, 0]])
# [0, 3, 4]