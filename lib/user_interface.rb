require "pry"
class UserInterface

    attr_reader :prompt

    def initialize
        @current_user = nil
        @prompt = TTY::Prompt.new
    end 

    def new_user(username)
        @current_user = User.find_or_create_by(username: username)

    end

    def greet
        puts "Welcome to Story2Go, if you love creating stories, you’re in the right place!"
        username = prompt.ask('Please create your username?', default: 'Anonymous')
        puts "Hello, #{username}. Instructions:
        You will be given three random characters,
        You will also be given a random location
        With this information you may create any story you’d like!"
        new_user(username)
        puts "-----------------------------------------------------"
        mini_menu
    end 

    def mini_menu
        mini_menu = prompt.select "Please choose from the following options", "Move onto the next phase","Go to Main Menu","Exit"


        case mini_menu
        when "Move onto the next phase"
            next_phase
        when "Go to Main Menu"
            main_menu
        when "Exit"
            exit
        end

    end

    def next_phase
        puts "Here are your 3 characters"
        puts "**************************"
        sleep 3
        random_characters
        puts "****************************"
        sleep 3
        puts "Here's your destiny"
        puts "***************************"
        sleep 3
        random_location
        puts "---------------------------"
    end



    def random_characters
        # characters = ["Wizard","Witch","Ogre","Dragon","Fairy","Goblin","Griffen","Elf","Gnome","Vampire","Werewolf","Shapeshifter","Mermaid","Lochness Monster", "Sasquatch (Big Foot)"]
        all_characters = Creature.all_creatures
        randomized = all_characters.sample(3)
        puts randomized
        
    end

    def random_location
        # location = ["Hogwarts","Black Forest","Aokigahara Forest(Look it up, if you don't know :( )", "Babylon", "Atlantis"]
        all_location = Location.all_locations
        # all_locations = Location.all.map{|place| place.name}
        destiny_location = all_location.sample
        puts destiny_location
    end



end 
