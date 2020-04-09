class Array
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0

    while i < size
      yield(self[i])
      i += 1
    end
    self
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    result_array = []
    i = 0

    while i < size
      result_array << yield(self[i])
      i += 1
    end
    result_array
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    result_array = []
    i = 0

    while i < size
      result_array << self[i] if yield(self[i])
      i += 1
    end
    result_array
  end
end
