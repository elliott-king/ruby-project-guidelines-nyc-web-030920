require 'nokogiri'
require "pry"
require "json"
require "net/http"
require "open-uri"

Position.destroy_all
Candidate.destroy_all
Company.destroy_all

class GithubAPI
  def self.seed_positions(data)
    data.each do |position|
      p = Position.new()
      p.api_id = position["id"]
      p.position_type = position["type"]
      p.url = position["url"]
      p.created_at = position["created_at"]
      p.location = position["location"]
      p.title = position["title"]
      p.description = Nokogiri::HTML::DocumentFragment.parse(position["description"]).text #removes html tags
      
      if Nokogiri::HTML::DocumentFragment.parse(position["how_to_apply"]).xpath(".//a")
        p.how_to_apply = Nokogiri::HTML::DocumentFragment.parse(position["how_to_apply"]).xpath('.//a').attribute("href")
      else
        p.how_to_apply = Nokogiri::HTML::DocumentFragment.parse(position["how_to_apply"]).text #removes html tags
      end

      c = Company.find_or_create_by(name: position["company"])
      if !c.url
        c.url = position["company_url"]
      end
      if !c.company_logo 
        c.company_logo = position["company_logo"]
      end
      c.save
      p.company = c
      p.save
    end
  end

  def self.api_call(page)
    first_fifty = "https://jobs.github.com/positions.json"
    next_page = first_fifty + "?page=" + page.to_s
    
    if page == 0
      uri = URI.parse(URI.escape(first_fifty))
    else
      uri = URI.parse(URI.escape(next_page))
    end
    
    response = Net::HTTP.get_response(uri)

    data = JSON.parse(response.body)

    seed_positions(data)

    data

  end

  def self.initial_api_call
    self.api_call(1)
  end

  def self.seed_positions_until_full
    data = self.initial_api_call #initial seeding for page 0

    page = 2 #increment to page 1 for next batch

    until data.empty? do #loop until the page called returns empty
      data = api_call(page)
      page += 1
    end

  end
end

GithubAPI.seed_positions_until_full

yueying = Candidate.new(name: 'Yueying', gpa: 3.0, education_level: 'phd', native_language: 'Chinese', second_language: 'English').save
josh = Candidate.new(name: 'Josh', gpa: 4.0, education_level: 'bachelor', native_language: 'English', second_language: 'Chinese').save 
elliott = Candidate.new(name: 'Elliott', gpa: 5.0, education_level: 'bachelor', native_language: 'English').save 
brett = Candidate.new(name: 'Brett', gpa: 2.99, education_level: 'master', native_language: 'French', second_language: 'English').save 



  # TODO: return link from how_to_apply
  # Removing html tags in text blocks with Nokogiri DocumentFragment class
  # Returns all responses from all api pages