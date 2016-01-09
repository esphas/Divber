# *Analizer* analizes the source site and outputs the action that should be performed on specific files.
class Divber::Analyzer

  # initialize with the root path of the source site.
  #
  # @param root [String] the root path of the source site
  # @param config [Configuration] the Configuration
  def initialize root, config
    @root = root
    @config = config
  end

  # (see Site#analyze)
  def analyze
    # TODO:
    Divber::Structure.new
  end
end
