# Goal: Create a circular queue that you can add or remove items to.
#
# RULES:
#   A max size is designated
#   Items can be added until max size is reached
#   Once max size is reached, any new item takes the place of oldest item
#   When deleting, oldest item is deleted first
#   If all spots are empty, deleting returns nil
#
# DATA STRUCTURES
#   Hash where timestamp is the key (always unique!) and value is the value?
#   This would allow for duplicate values
#
#   TWO ARRAYS
#     -One array has the elements
#     -Other array has the timestamps
#     -This also allows for duplicate timestamps
#
# ALGORITHM
#   initialize
#     create an array of given size for queue
#     create an array of given size for tracker
#     create a counter that starts at 0
#   Queue
#     if there's an open spot
#       insert given value there
#       assign time to spot in tracker
#     Otherwise,
#       insert given value at spot with oldest time
#
#   Dequeue
#     If all spots are empty
#       return nil
#     Otherwise,
#       delete and save value at oldest spot
#       assign nil to that spot
#
#   find_open_spot
#     return index of nil
#
#   oldest_index
#     find index of oldest time in tracker
#
class CircularQueue
  def initialize(buffer)
    @buffer = buffer
    @tracker = Array.new(buffer)
    @queue = Array.new(buffer)
  end
  
  def empty?
    queue.all?(nil)
  end
  
  def open_spot?
    queue.any?(nil)
  end
  
  def open_index
    queue.index(nil)
  end

  def find_insert_spot
    if open_spot?
      open_index
    else
      oldest
    end
  end

  def oldest
    tracker.index(times.min)
  end
  
  def times
    tracker.select {|el| el.class == Time}
  end

  def enqueue(element)
    i = find_insert_spot
    tracker[i] = Time.now
    queue[i] = element
  end

  def dequeue
    return nil if empty?
    el = queue[oldest]
    queue[oldest] = nil
    tracker[oldest] = nil
    el
  end

  private

  attr_reader :buffer, :queue, :tracker
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil