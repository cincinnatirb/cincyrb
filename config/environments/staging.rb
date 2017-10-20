require_relative 'production'

Rails.application.configure do
  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug
end
