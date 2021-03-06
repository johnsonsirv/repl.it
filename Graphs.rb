=begin
    You will be given lists of numbers as input based on the above format. Then start from Node 0 and repeatedly visit the next connected node until you reach Node 4. You need to return an array with all the nodes visited.
While Nodes don't necessarily have a set order for their connections, in this challenge you should go to the first Node in the list of input. For example, in the above graph, go from 0 to 2 to 5 to 4 and then stop.

=end
require "benchmark/ips" 
require "benchmark" 

def graph_with_hash_assoc(hash_graph)
  next_node = 0
  result= [next_node]
  until next_node==4
    next_node = hash_graph.assoc(next_node).last.first
    result << next_node
  end
  result
end

def graph(hash_graph)
    # write your code here
    result =[]
    node = 0
    result <<  node
    until node == 4 do
        next_node = hash_graph[node][0];
        result << next_node
        node = next_node
    end
    result
  end
 
 def graph_recursive(hash_graph)
    $result =[]
    move_next_node(0, hash_graph)
 end
 def move_next_node(node, hash_graph)
   $result << node
   return $result if node==4
   next_node = hash_graph[node][0]
   move_next_node(next_node, hash_graph)
 end

 

  
  hash = { 
    0 => [2], 
    1 => [4], 
    2 => [5, 0, 3], 
    3 => [2], 
    4 => [1, 5], 
    5 => [4, 2]
  }
  

  Benchmark.ips do |x|
    x.report("iteration") { graph(hash) }
    x.report("recursive") { graph_recursive(hash) }
    x.report("graph_with_hash_assoc") { graph_with_hash_assoc(hash) }
    x.compare!
  end

  # Benchmark.bmbm do |x|
  #   x.report("iterative:") { graph(hash) }
  #   x.report("recursive:") { graph_recursive(hash) }
  #   x.report("graph_with_hash_assoc") { graph_with_hash_assoc(hash) }
  # end
#   print graph(hash)
  # => [0, 2, 5, 4]
  # print graph_recursive(hash)

  # print graph_with_hash_assoc(hash)
