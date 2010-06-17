require 'rubygems'
require 'sinatra'
require 'config'

get '/' do
  host = request.env['HTTP_HOST']
  config = Page::Config.for_host(host)
  if config && file_exists?(config['view'])
    erb config['view'].to_sym
  else
    erb Page::Config.default['view'].to_sym
  end
end

def file_exists?(filename)
  return false if !filename
  filepath = File.expand_path(File.join(File.dirname(__FILE__), "/../views/#{filename}.erb"))
  File.exists?(filepath)
end
