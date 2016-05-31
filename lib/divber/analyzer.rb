# *Analizer* analizes the source site and outputs the action that should be performed on specific files.
class Divber::Analyzer

  # initialize with the root path of the source site.
  #
  # @param config [Configuration] the Configuration
  def initialize config
    Divber::Log.debug "#{ self.class }##{ __callee__ } #{ config.inspect }"
    @config = config
  end

  # (see Site#analyze)
  def analyze
    Divber::Log.debug "#{ self.class }##{ __callee__ }"
    structure = Divber::Structure.new
    pwd = Dir.pwd
    Dir.chdir @config['source']
    Dir['**/*'].each do |filename|
      Divber::Log.debug "  #{ filename }>".successfy
      if FileTest.file? filename
        Divber::Log.debug '    file'.successfy
        if ignored_file? filename
          Divber::Log.debug '    ignored'.successfy
        elsif binary_file? filename
          structure.binary filename
        else
          structure.source filename
        end
      else
        Divber::Log.debug '    directory'.successfy
      end
    end
    Dir.chdir pwd
    Divber::Log.debug 'End Processing'.successfy
    structure
  end

  # odd out ignored files
  #
  # @param filename filename of the file (relative path)
  #
  # @return [Boolean] true for ignored files
  def ignored_file? filename
    @config['ignored_files'].flat_map{|g| Dir[g]}.include?(filename) ||
    %w{ include_dir layout_dir sass_dir }.flat_map{|d| Dir[File.expand_path('**/*', @config[d])]}.include?(File.absolute_path filename)
  end

  # odd out binary files
  #
  # @param filename (see ignored_file?)
  #
  # @return [Boolean] true for binary files
  def binary_file? filename
    @config['binary_files'].flat_map{|g| Dir[g]}.include?(filename)
  end
end
