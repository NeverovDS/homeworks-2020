class LogsValidator
  attr_reader :logs_to_check

  def initialize(logs_to_check)
    @logs_to_check = logs_to_check
  end

  LOG_VALIDATE = %r{
(?<ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}).{5}\[
(?<date>\d{1,2}/\w{3}/\d{4}\:\d{,2}:\d{,2}:\d{,2}\s\+\d{4})\]\s"POST\s
(?<url>/\w+/\d+/\w+)\s
}x.freeze

  def task_2
    arr = []
    valid_logs = 0
    logs_to_check.map do |line|
      next unless line.match?(LOG_VALIDATE)

      matches = line.match(LOG_VALIDATE)
      arr << "#{matches[:date]} FROM:#{matches[:ip]} TO:#{matches[:url].upcase}"
      valid_logs += 1
    end
    puts(arr)
    puts if valid_logs.zero?
  end
end
