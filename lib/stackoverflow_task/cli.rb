require 'thor'
require 'stackoverflow_task'

module StackoverflowTask
  class CLI < Thor
    desc 'search', 'Find number of tags for each programming language from the yaml file on stackoverflow'
    option :file, :required => true, :aliases => '-f'
    def search
      finder = Finder.new
      ap finder.search(options.fetch('file'))
    end
  end
end