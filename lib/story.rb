class Story < ActiveRecord::Base
    belongs_to :user
    belongs_to :location

    def self.all_stories
       Story.all
    end

    def self.story_title
        all_stories.map{|story| story.title}
    end

    def self.location_n
        Story.all.map{|story| story.location.name }.uniq 
    end


end 