require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutArrays < EdgeCase::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, 2], array

    array << 333
    assert_equal [1,2,333], array
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    assert_equal :jelly, array[-1]
    assert_equal :butter, array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut], array[0,1]
    assert_equal [:peanut, :butter], array[0,2]
    assert_equal [:and, :jelly], array[2,2]
    assert_equal [:and, :jelly], array[2,20]
    assert_equal [], array[4,0]
    assert_equal [], array[4,100]
    assert_equal nil, array[5,0]
    # My Answer: I didn't get this at all...intuitively one would think
    # that all of the last 3 asserts would expect nil since the array
    # only contains elements 0-3, there is no element at index 4...and then
    # I found enlightenment here: http://www.ruby-forum.com/topic/1393096
    # Thanks Gary!  Here's the enlightening ASCII diagram:
    #  It helps to consider the numbering in the following way:
    #
    #  -4  -3  -2  -1    <-- numbering for single argument indexing
    #   0   1   2   3
    # +---+---+---+---+
    # | a | b | c | d |
    # +---+---+---+---+
    # 0   1   2   3   4  <-- numbering for two argument indexing or start of range
    #-4  -3  -2  -1
    #
    # Got it!  There is no spoon!
  end

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal [1,2,3,4,5], (1..5).to_a
    assert_equal [1,2,3,4], (1...5).to_a
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut, :butter, :and], array[0..2]
    assert_equal [:peanut, :butter], array[0...2]
    assert_equal [:and, :jelly], array[2..-1]
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    assert_equal [1,2,:last], array

    popped_value = array.pop
    assert_equal :last, popped_value
    assert_equal [1,2], array
  end

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first)

    assert_equal [:first,1,2], array

    shifted_value = array.shift
    assert_equal :first, shifted_value
    assert_equal [1,2], array
  end
  
  def test_push_pop_shift_arrays
    array = [1,2]
    array.push(:last)
    array.unshift(:first)
    assert_equal [:first,1,2,:last], array
    pop_value = array.pop
    shift_value = array.shift
    assert_equal :last, pop_value
    assert_equal :first, shift_value
    assert_equal [1,2], array
  end

end
