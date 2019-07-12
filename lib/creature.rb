class Creature < ActiveRecord::Base
    has_many :stories, through: :user
    belongs_to :story
    

    def self.all_creatures
        Creature.all.map{|char| char.creature}
    end
    
    def self.random_name
        Creature.all_creatures.sample(3)
    end

    def self.random_weapon
        Creature.all.map{|char| char.weapon}
    end

    
end 