# *Configuration* stores the configurations of the site.
class Divber::Configuration

  AlreadyInitialized = 'The site is already initialized, no need to initialize again!'

  # (see Site#helloworld)
  #
  # @param root (see Analyzer#initialize)
  def self.init root
    abort AlreadyInitialized.warningfy if FileTest.exist? self.config_filename
    cfg = {
      # TODO: Default config entries
    }
    open self.config_filename, 'wb' do |configf|
      configf.write cfg.to_yaml
    end
  end

  #
  def self.config_filename
    '.cfg.divber.yml'
  end

  # initialize with config files in source site.
  #
  # @param root (see Analyzer#initialize)
  def initialize root
    @config = YAML.load open Configuration.config_filename, 'rb', &:read
  end
end
