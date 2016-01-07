# *Manager* manages the whole procedures of a certain action.
class Divber::Manager

  # start a task with given command, options and arguments.
  #
  # @param cmd [Symbol] the name of the command called
  # @param opts [Hash] the options parsed from command line arguments
  # @param args [Array] the (remaining unparsed) command line arguments
  #
  # @return [Boolean]
  def initialize cmd, opts, args
    # TODO:
    puts "cmd: #{cmd}\nopts: #{opts}\nargs: #{args}"
  end
end
