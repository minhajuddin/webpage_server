require 'yaml'

module Page
  class Config
    @@config = YAML::load(File.open('config.yaml'))

    def self.default
      @@default ||= @@config['default']
    end

    def self.for_host(host)
      return @@config[host] if @@config[host]
      return self.default
    end

  end
end
