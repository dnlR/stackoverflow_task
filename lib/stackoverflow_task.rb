require 'yaml'
require 'cgi'
require 'open-uri'
require 'json'
require 'awesome_print'
require_relative 'stackoverflow_task/version'

module StackoverflowTask
  class Finder
    def search(file)
      begin
        file = load_file(file)
        langs = parse_file(file)
        url = format_url(langs)
        data = perform_search(url)
        extract_tags(data)
      rescue Exception => ex
        abort("ERROR: #{ex.message}")
      end
    end

  #######
  private
  #######

    def load_file(f)
      File.file?(f) ? YAML.load_file(f) : fail(ArgumentError, 'Invalid File.')
    end

    def parse_file(f)
      begin
        f.first.fetch('langs').join(';')
      rescue
        fail(ArgumentError, 'Invalid File.')
      end
    end

    def format_url(langs)
      "https://api.stackexchange.com/2.2/tags/#{CGI.escape(langs)}/info?" +
          "order=desc&sort=popular&site=stackoverflow&filter=!*MPoAL(IL3-.kkE)"
    end

    def perform_search(url)
      JSON.parse(open(url).read)
    end

    def extract_tags(data)
      items = data.fetch('items')
      fail(ArgumentError, 'No results found.') unless items.any?
      Hash[items.map { |tag| [tag['name'], tag['count']] }]
    end
  end
end