class Creature < ActiveRecord::Base
    has_many :stories, through: :user
    belongs_to :story
    

    def self.all_creatures
        Creature.all.map{|char| char.creature}
    end 
end 