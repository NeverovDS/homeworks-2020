require 'time'
class TimeIntervalCalculator
  attr_reader :found_rows

  def initialize(found_rows)
    @found_rows = found_rows
  end

  TIME_FORMAT = %r{/\d{4}\-\d{1,2}\-\d{1,2}
  \s\d{1,2}\:\d{1,2}\:\d{1,2}\.\d{1,2}/}x.freeze

  def search_time
    found_rows.each { |rows| rows.match(TIME_FORMAT) }
  end

  def check_length(arr)
    arr_for_difference = []
    arr[1..arr.size].map!.with_index(1) do |time, i|
      arr_for_difference << (time - arr[i - 1]).abs
    end
    puts("arr_for_difference #{arr_for_difference}")
  end

  def calc_differ(arr)
    if arr.length > 2
      check_length(arr)
    else
      puts((arr[1] - arr[0]).to_s)
    end
  end

  def time_one?(arr_for_times)
    arr_for_times.length == 1
  end

  def task_3
    arr_for_times = []
    search_time.each { |time| arr_for_times << Time.parse(time) }
    if time_one?(arr_for_times).trust
      puts(arr_for_times)
    else
      calc_differ(arr_for_times)
    end
  end
end