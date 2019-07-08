class Location < ActiveRecord::Base
    has_many :stories
    has_many :users, through: :stories

    def self.all_locations
        Location.all.map{|place| place.name}
    end 
end