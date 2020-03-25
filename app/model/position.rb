class Position < ActiveRecord::Base
  has_many :applications
  has_many :candidates, through: :applications
  belongs_to :company

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

  def self.search_type(type)
    self.all.select do |position|
      position.position_type.downcase.include?(type.downcase)
    end
  end

  def self.search_recent_positions
    puts "Here are positions created in last 30 days: "
    self.all.select do |position|
      d = DateTime.now - 30 
      position.created_at > d 
    end
  end






end