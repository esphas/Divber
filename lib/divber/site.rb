# *Site* represents the site and keeps index of all objects in the site.
class Divber::Site

  # initialize with the path to the source site.
  #
  # @param source [String] the root path of the source site
  def initialize source
    @source = source
  end

  # generates the basic config files for a Divber site if they are not present yet.
  #
  # @return [Configuration] the Configuration object
  def helloworld
    Divber::Configuration.init @source
  end

  # config from the config files in the source site.
  #
  # @return [Configuration] the Configuration object
  def config
    @config = Divber::Configuration.new @source
  end

  # analize the files and directories in the source site and create a Structure for building dest site.
  #
  # @return [Structure] a Structure for building dest site
  def analyze
    analyzer = Divber::Analyzer.new @source, @config
    @structure = analyzer.analyze
  end

  # perform all required actions to build dest site in specified directory.
  #
  # @param dest [String] the path to the directory in which dest site will be built
  #
  # @return [Boolean] true for success
  def build dest
    @structure.apply dest, @config
  end
end
