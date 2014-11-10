# What does this script do?
# find the **breadth traversal binary tree** 
# from **in order traversal binary tree** and **post order traversal binary tree**
# For more detail:
# http://en.wikipedia.org/wiki/Tree_traversal
# 

def find_breadth_traversal_tree(in_order,post_order,level, h)
  # level => 0F 0T 1F 1T etc
  if in_order.size == nil || in_order.size == 0
    puts "finish"
  elsif in_order.size == 1
    # finish
    yield(level, in_order[0])
    puts "#{level} \t #{in_order[0]}"
  else 
    # this is not finished yet
    max_index_in_post = 0
    max_index_in_in = 0
    in_order.each_with_index do |in_ele,in_index|
      post_index = post_order.index(in_ele)

      if post_index > max_index_in_post
        max_index_in_post = post_index
        max_index_in_in = in_index
      end

    end
    current_root = in_order[max_index_in_in]
    yield(level, current_root)
    puts "#{level} \t #{current_root}"

    level[0] = (Integer(level[0])+1).to_s
    next_level_f = level+"F"
    next_level_t = level+"T"
    front_of_in = in_order[0...max_index_in_in]
    tail_of_in = in_order[(max_index_in_in+1)...in_order.size]
    
    #
    find_breadth_traversal_tree(front_of_in,post_order,next_level_f, h) {|level,ele| h[level] = ele}
    find_breadth_traversal_tree(tail_of_in,post_order,next_level_t, h) {|level,ele| h[level] = ele}

    #
  end # end of else


end

in_order = "4,2,7,5,8,1,3,9,6,11,10".split(",")
post_order = "4,7,8,5,2,9,11,10,6,3,1".split(",")

h = Hash.new 
find_breadth_traversal_tree(in_order,post_order,"0F",h) {|level,ele| h[level] = ele}

p h
arr = h.sort_by{|k,v| k}.to_a

new_arr = Array.new

arr.each do |ele|
  new_arr << ele[1]
end

p new_arr



in_order =   "A,B,C,D,E,F,G,H,I".split(",")
post_order = "A,C,E,D,B,H,I,G,F".split(",")

h = Hash.new 
find_breadth_traversal_tree(in_order,post_order,"0F",h) {|level,ele| h[level] = ele}

arr = h.sort_by{|k,v| k}.to_a

new_arr = Array.new

arr.each do |ele|
  new_arr << ele[1]
end

p new_arr