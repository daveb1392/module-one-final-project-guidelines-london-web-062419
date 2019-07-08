class Creature< ActiveRecord::Base
    has_many :stories, through: :user
    belongs_to :story
end 