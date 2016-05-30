# *Analizer* analizes the source site and outputs the action that should be performed on specific files.
class Divber::Analyzer

  # initialize with the root path of the source site.
  #
  # @param root [String] the root path of the source site
  # @param config [Configuration] the Configuration
  def initialize root, config
    Divber::Log.debug "#{ self.class }##{ __callee__ } #{ root.inspect }, #{ config.inspect }"
    @root = root
    @config = config
  end

  # (see Site#analyze)
  def analyze
    Divber::Log.info "#{ self.class }##{ __callee__ }"
    structure = Divber::Structure.new
    pwd = Dir.pwd
    Dir.chdir @root
    Dir['**/*'].each do |filename|
      Divber::Log.debug "  #{ filename } processing..."
      next if FileTest.directory? filename
      Divber::Log.debug "    #{ filename } is not a directory"
      if ignored_file? filename
        Divber::Log.debug "    #{ filename } is ignored"
      else
        structure.append filename
      end
    end
    Dir.chdir pwd
    Divber::Log.debug "End Processing"
    structure
  end

  # odd out ignored files
  #
  # @param filename filename of the file
  #
  # @return [Boolean] true for ignored files
  def ignored_file? filename
    /(^|\/)\.[^\/]/ =~ filename
  end
end
