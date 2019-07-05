class User < ActiveRecord::Base
    has_many :stories
    has_many :locations, through: :stories
end 