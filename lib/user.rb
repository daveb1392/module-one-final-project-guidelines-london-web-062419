class User < ActiveRecord::Base
    has_many :stories
    has_many :locations, through: :stories
    has_many :creatures, through: :stories


    def all_user_content
    self.stories.collect{|story| story.content}
    end

    def all_user_title
        self.stories.collect{|story| story.title}
    end
   




end 