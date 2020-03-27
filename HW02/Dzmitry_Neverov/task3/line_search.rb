class LineSearcher
  attr_reader :some_lines

  def initialize(some_lines)
    @some_lines = some_lines
  end

  NEED_LOG = /.*Calling core with action.*/.freeze

  def find_lines
    some_lines.select { |line| line.match?(NEED_LOG) }
  end
end
