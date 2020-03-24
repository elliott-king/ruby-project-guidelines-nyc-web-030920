require "pry"
require "json"
require "net/http"
require "open-uri"

Position.destroy_all

OUR_URL = "https://jobs.github.com/positions.json"
uri = URI.parse(URI.escape(OUR_URL))
response = Net::HTTP.get_response(uri)

data = JSON.parse(response.body)
# TODO: more than just first page
# TODO: return link from how_to_apply
data.each do |position|
  p = Position.new()
  p.api_id = position["id"]
  p.position_type = position["type"]
  p.url = position["url"]
  p.created_at = position["created_at"]
  p.company = position["company"]
  p.company_url = position["company_url"]
  p.location = position["location"]
  p.title = position["title"]
  p.description = position["description"]
  p.how_to_apply = position["how_to_apply"]
  p.company_logo = position["company_logo"]
  p.save
end
