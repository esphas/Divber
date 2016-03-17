# *Manager* manages the whole procedures of a certain action.
class Divber::Manager

  InvalidCommand = 'Invalid command called! Divber cannot continue!'

  # start a task with given command, options and arguments.
  #
  # @param cmd [Symbol] the name of the command called
  # @param opts [Hash] the options parsed from command line arguments
  # @param args [Array] the (remaining unparsed) command line arguments
  #
  # @return [Boolean] true for success
  def initialize cmd, opts, args
    metname = 'command_' + cmd.to_s
    abort [InvalidCommand, ?\n, ?\t, cmd.to_s].join.failurefy unless respond_to? metname
    met = method metname
    met.call opts, args
    return true
  end

  # invoked when 'divber new' is called, generates the basic config files for a Divber site in current directory.
  #
  # @param opts (see #initialize), should be empty
  # @param args (see #initialize), should be empty
  #
  # @return [Site] a Site based on current directory
  def command_new opts, args
    root = args[0] || default_source
    FileUtils.mkpath root
    site = Divber::Site.new root
    site.helloworld
    site
  end

  # invoked when 'divber build' is called, build a Divber site to dest directory from source directory.
  #
  # @param opts (see #initialize), opts[:source] and opts[:dest] are optional for manually specifying source and dest directories
  # @param args (see #initialize), should be empty
  #
  # @return [Site] a Site based on source directory
  def command_build opts, args
    src  = args[0] || default_source
    dest = opts[:dest] || default_dest
    site = Divber::Site.new src
    site.config
    site.analyze
    site.build dest
    site
  end

  # the default source directory
  #
  # @return [String] defaults to '.'
  def default_source
    ?.
  end

  # the default dest directory
  #
  # @return [String] defaults to '_divbersite'
  def default_dest
    '_divbersite'
  end
end
