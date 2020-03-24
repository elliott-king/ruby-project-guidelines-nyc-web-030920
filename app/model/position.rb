class Position < ActiveRecord::Base
  has_many :applications
  has_many :candidates, through: :applications

  #create methods start here
  #search_postions with desired attributes
  def self.search_title(title)
    self.all.select do |position|
      position.title.downcase.include?(title.downcase)
    end
  end

  def self.search_location(location)
    self.all.select do |position|
      position.location.downcase.include?(location.downcase)
    end
  end

  def self.search_company(company)
    self.all.select do |position|
      position.company.downcase.include?(company.downcase)
    end
  end
  





end