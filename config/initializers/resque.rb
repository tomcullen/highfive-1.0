uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
Dir[File.join(Rails.root, 'app', 'jobs', '*.rb')].each { |file| require file }
config = YAML::load(File.open("#{Rails.root}/config/redis.yml"))[Rails.env]
# Resque.redis = Redis.new(:host => config['host'], :port => config['port'])
Resque.redis = REDIS