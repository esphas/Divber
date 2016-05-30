
module Divber
  Log = Logger.new STDOUT
  Log.level = Logger::DEBUG
  Log.formatter = proc do |severity, datetime, progname, msg|
    "#{ severity[0, 1] }> #{ msg }\n"
  end
end

#
class String

  #
  def warningfy
    "\e[33m#{ self }\e[0m"
  end

  #
  def successfy
    "\e[32m#{ self }\e[0m"
  end

  #
  def failurefy
    "\e[31m#{ self }\e[0m"
  end
end
