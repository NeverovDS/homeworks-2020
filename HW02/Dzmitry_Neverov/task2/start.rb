require_relative 'logs_reader.rb'
require_relative 'logs_validator.rb'

logs_to_check = ReaderLogs.new(ARGV[0]).read_file
LogsValidator.new(logs_to_check).task_2
