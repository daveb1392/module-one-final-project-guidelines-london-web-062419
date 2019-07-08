class User < ActiveRecord::Base
    has_many :stories
    has_many :locations, through: :stories

    def new_user
    end 
end 