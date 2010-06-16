require 'rubygems'
require 'sinatra'


get '/' do
  host = request.env['HTTP_HOST']
  if file_exists?(host)
    erb host.to_sym
  else
    erb :not_found
  end
end


def file_exists?(filename)
  filepath = File.expand_path(File.join(File.dirname(__FILE__), "views/#{filename}.erb"))
  File.exists?(filepath)
end

