class Location < ActiveRecord::Base
    has_many :stories
    has_many :users, through: :stories

    def self.all_locations
        # Location.all.map{|place| place.name}
        Location.all
    end

    def self.all_location_names
        Location.all.map { |place| place.name }
    end

    def self.unique_location
        all_location_names.sample
    end
end