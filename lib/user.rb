class User < ActiveRecord::Base
    has_many :stories
    has_many :locations, through: :stories
    has_many :creatures, through: :stories

    # def new_user(username)
    #     @current_user = self.find_or_create_by(username: username)
    # end 

   




end 