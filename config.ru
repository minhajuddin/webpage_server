require 'rubygems'
require 'sinatra'
$:<< File.expand_path(File.join(File.dirname(__FILE__), 'lib'))
$:<< File.expand_path(File.dirname(__FILE__))
 
set :env,  :production
disable :run

require 'server'

run Sinatra::Application
