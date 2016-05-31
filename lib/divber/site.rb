# *Site* represents the site and keeps index of all objects in the site.
class Divber::Site

  autoload :Page, 'divber/site/page'
  autoload :Site, 'divber/site/site'

  # initialize with the path to the source site.
  #
  # @param source [String] the root path of the source site
  def initialize source
    Divber::Log.debug "#{ self.class }##{ __callee__ } #{ source.inspect }"
    @source = source
  end

  # generates the basic config files for a Divber site if they are not present yet.
  #
  # @return [Configuration] the Configuration object
  def helloworld override
    Divber::Log.debug "#{ self.class }##{ __callee__ } #{ override.inspect }"
    Divber::Configuration.init @source, override
  end

  # config from the config files in the source site.
  #
  # @return [Configuration] the Configuration object
  def config
    Divber::Log.debug "#{ self.class }##{ __callee__ }"
    @config = Divber::Configuration.new @source
  end

  # analize the files and directories in the source site and create a Structure for building dest site.
  #
  # @return [Structure] a Structure for building dest site
  def analyze
    Divber::Log.debug "#{ self.class }##{ __callee__ }"
    analyzer = Divber::Analyzer.new @config
    @structure = analyzer.analyze
  end

  # perform all required actions to build dest site in specified directory.
  #
  # @param dest [String] the path to the directory in which dest site will be built
  #
  # @return [Boolean] true for success
  def build dest
    Divber::Log.debug "#{ self.class }##{ __callee__ } #{ dest.inspect }"
    @structure.apply dest, @config
  end
end
