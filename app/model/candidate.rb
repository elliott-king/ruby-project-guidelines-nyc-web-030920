class Candidate < ActiveRecord::Base
    has_many :applications
    has_many :postions, through: :applications
end
