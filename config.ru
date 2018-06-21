require 'sinatra'
require 'sinatra/reloader' if development?
require_relative './controllers/caffeines_controller.rb'

# MiddleWare
use Rack::Reloader
use Rack::MethodOverride

run CaffeineController
