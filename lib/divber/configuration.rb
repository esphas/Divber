# *Configuration* stores the configurations of the site.
class Divber::Configuration

  AlreadyInitialized = 'The site is already initialized, no need to initialize again!'

  # (see Site#helloworld)
  #
  # @param root (see Analyzer#initialize)
  def self.init root
    path = File.expand_path root + ?/ + self.config_filename
    abort AlreadyInitialized.warningfy if FileTest.exist? path
    open path, 'wb' do |configf|
      configf.write suggested_config.to_yaml
    end
  end

  # TODO: suggested configs
  def self.suggested_config
    {}
  end

  # TODO: default configs
  def self.default_config
    {}
  end

  # TODO: write comments
  def self.config_filename
    '.cfg.divber.yml'
  end

  # initialize with config files in source site.
  #
  # @param root (see Analyzer#initialize)
  def initialize root
    path = File.expand_path root + ?/ + self.class.config_filename
    @config = YAML.load open path, 'rb', &:read
  end

  # TODO: write comments
  def [] key
    @config[key] || self.class.default_config[key]
  end
end
