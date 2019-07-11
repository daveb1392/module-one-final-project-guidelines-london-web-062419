class Trait< ActiveRecord::Base

    def self.all_traits
        Trait.all.map{|trait| trait.name}
    end 
end 