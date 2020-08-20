require 'sinatra'
require 'watir'
require "sinatra/json"

get '/' do
  results = []
  browser = Watir::Browser.new :chrome, args: %w[--headless --no-sandbox --disable-dev-shm-usage --disable-gpu]

  browser.goto 'https://www.instagram.com/lucy_eyelash_beauty/'
  imgs = browser.images(:class => "FFVAD")

  results = imgs.map {|img| img.src}
  # => 'Guides – Watir Project'
  browser.close
  json results
end
