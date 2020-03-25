require 'nokogiri'
require "pry"
require "json"
require "net/http"
require "open-uri"

Position.destroy_all
Candidate.destroy_all

OUR_URL = "https://jobs.github.com/positions.json"
uri = URI.parse(URI.escape(OUR_URL))
response = Net::HTTP.get_response(uri)

data = JSON.parse(response.body)
# TODO: more than just first page
# TODO: return link from how_to_apply
#Removing html tags in text blocks with Nokogiri DocumentFragment class

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
  p.description = Nokogiri::HTML::DocumentFragment.parse(position["description"]).text #removes html tags
  p.how_to_apply = Nokogiri::HTML::DocumentFragment.parse(position["how_to_apply"]).text #removes html tags
  p.company_logo = position["company_logo"]
  p.save
end

yueying = Candidate.new(name: 'Yueying', gpa: 3.0, education_level: 'phd', native_language: 'Chinese', second_language: 'English').save
josh = Candidate.new(name: 'Josh', gpa: 4.0, education_level: 'bachelor', native_language: 'English', second_language: 'Chinese').save 
elliott = Candidate.new(name: 'Elliott', gpa: 5.0, education_level: 'bachelor', native_language: 'English').save 
brett = Candidate.new(name: 'Brett', gpa: 2.99, education_level: 'master', native_language: 'French', second_language: 'English').save 
