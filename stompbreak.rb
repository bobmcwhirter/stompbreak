require 'rubygems'
require "sinatra"
require "sinatra/reloader" 

get '/whatever' do
  render :index
end
