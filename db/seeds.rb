require "pry"
require "json"
require "net/http"
require "open-uri"

OUR_URL = "https://jobs.github.com/positions.json"
puts URI.escape(OUR_URL)
puts OUR_URL
uri = URI.parse(URI.escape(OUR_URL))
response = Net::HTTP.get_response(uri)

# data is an array with 50 elements
data = JSON.parse(response.body) 
# TODO: return link from how_to_apply

binding.pry # check our data