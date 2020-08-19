require 'sinatra'
require 'watir'
require 'headless'
require "sinatra/json"

get '/' do
  results = []
  # headless = Headless.new
  # headless.start
  browser = Watir::Browser.new

  browser.goto 'https://www.instagram.com/lucy_eyelash_beauty/'
  imgs = browser.images(:class => "FFVAD")

  results = imgs.map {|img| img.src}
  # => 'Guides – Watir Project'
  browser.close
  json results
end
