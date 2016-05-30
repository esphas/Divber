# *Configuration* stores the configurations of the site.
class Divber::Configuration

  AlreadyInitialized = 'The site is already initialized, no need to initialize again!'

  # (see Site#helloworld)
  #
  # @param root (see Analyzer#initialize)
  def self.init root, override
    Divber::Log.info "#{ self }.#{ __callee__ } #{ root.inspect }, #{ override.inspect }"
    path = self.config_path root
    override ? [File.delete(path), Divber::Log.warn(AlreadyInitialized.warningfy)] : abort(AlreadyInitialized.warningfy) if FileTest.exist? path
    open path, 'wb' do |configf|
      configf.write suggested_config.to_yaml
    end
  end

  # suggested configs that are written in the config file upon initializing a site.
  #
  # @return [Hash] suggested config
  def self.suggested_config
    {}
  end

  # default configs that are used when no custom configs are in exsitence.
  #
  # @return [Hash] default config
  def self.default_config
    {}
  end

  # default filename for the config file.
  #
  # @return [String] filename
  def self.config_filename
    '.cfg.divber.yml'
  end

  # the path to the config file in the given root directory
  #
  # @param root (see Analyzer#initialize)
  #
  # @return [String] path
  def self.config_path root
    Divber::Log.debug "#{ self }.#{ __callee__ } #{ root.inspect }"
    path = File.expand_path self.config_filename, root
  end

  # initialize with the config file in source site.
  #
  # @param root (see Analyzer#initialize)
  def initialize root
    Divber::Log.debug "#{ self.class }##{ __callee__ } #{ root.inspect }"
    path = self.class.config_path root
    @config = YAML.load open path, 'rb', &:read
  end

  # get configs
  #
  # @param key [Symbol] the key for the config
  #
  # @return [Object] the config value
  def [] key
    Divber::Log.debug "#{ self.class }##{ __callee__ } #{ key.inspect }"
    @config[key] || self.class.default_config[key]
  end

  #
  def inspect
    "#<#{ self.class }:#{ object_id }>"
  end
end
