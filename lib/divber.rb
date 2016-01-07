require 'divber/version'

# The main *Divber* module.
module Divber
  autoload :Analyzer,      'divber/analyzer'
  autoload :Configuration, 'divber/configuration'
  autoload :DestFile,      'divber/file-dest'
  autoload :File,          'divber/file'
  autoload :Manager,       'divber/manager'
  autoload :Parser,        'divber/parser'
  autoload :Site,          'divber/site'
  autoload :SourceFile,    'divber/file-src'
  autoload :StaticFile,    'divber/file-static'
  autoload :Structure,     'divber/structure'

  # (see Divber::Manager#initialize)
  def self.command cmd, opts = {}, args = []
    Manager.new cmd, opts, args
  end
end
