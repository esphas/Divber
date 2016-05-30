require 'erb'
require 'fileutils'
require 'logger'
require 'yaml' #TODO
require 'divber/version'
require 'divber/utils'

# The main *Divber* module.
module Divber
  autoload :Analyzer,      'divber/analyzer'
  autoload :Configuration, 'divber/configuration'
  autoload :ERBBinding,    'divber/erbbinding'
  autoload :Manager,       'divber/manager'
  autoload :Site,          'divber/site'
  autoload :SourceFile,    'divber/source-file'
  autoload :Structure,     'divber/structure'

  # (see Divber::Manager#initialize)
  def self.command cmd, opts = {}, args = []
    Manager.new cmd, opts, args
  end
end
