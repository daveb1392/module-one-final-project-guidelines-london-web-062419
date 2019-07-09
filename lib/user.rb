class User < ActiveRecord::Base
    has_many :stories
    has_many :locations, through: :stories
    has_many :creatures, through: :stories

    # def new_user(username)
    #     @current_user = self.find_or_create_by(username: username)
    # end 
    def all_user_content

    self.stories.collect{|story| story.content}

    end

    def all_user_title

        self.stories.collect{|story| story.title}
    end
   




end 