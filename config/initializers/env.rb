env_file = File.expand_path("#{__FILE__}/../../../.env")

if File.exists?(env_file)
  envs = File.readlines(File.open(env_file))
  envs.each do |line|
    next if line.nil?
    key, value = line.split('=')
    ENV[key] = value.to_s.strip
  end
end

