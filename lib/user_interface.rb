require "pry"
class UserInterface

    attr_reader :prompt, :current_user

    @@creatures = []

    def initialize
        @current_user = nil
        @prompt = TTY::Prompt.new
        @font = TTY::Font.new
    end 

    def greet
        puts "Welcome to Story2Go, if you love creating stories, you’re in the right place!"
        existing_user = prompt.select("Do you have an account with us?", %w(Yes No))
            if  existing_user == "Yes"
                username_login
            else existing_user == "No"
                @current_user = create_user
                puts "Your account has been created"
                sleep 1
                instructions
            end 
    end 

    def username_login
        heart = prompt.decorate(prompt.symbols[:heart])
        user_info = prompt.collect do 
            key(:username).ask('Please enter your username:', require: true)
            key(:password).mask('Please enter your password:', symbols: {mask: heart})
        end 
        user = User.where(username: user_info[:username], password: user_info[:password]).last
        if user.nil?
            sleep 1
            error_login
        else 
            puts "You're now logged in!  😎"
            @current_user = user
            instructions
        end
    end 

    def error_login
        error = prompt.select("Wrong login details! 😔  Please try again!", "Retry login", "Quit")
        sleep 1 
        case error   
            when "Retry login"
                    username_login
            when  "Quit"
                    exit
        end
    end


    def create_user
        heart = prompt.decorate(prompt.symbols[:heart])
        user_creds = prompt.collect do
            key(:username).ask('Please enter a username:', required: true)
            key(:password).mask('Please enter a password:', symbols: {mask: heart})
         end 
        @current_user = User.create(**user_creds)
        @current_user.save
        instructions
    end 

    def instructions  
        system "clear"
        5.times do puts "" end
        puts "Hello, #{@current_user.username}."
        puts "Instructions:"
        puts "You will be given three random characters,"
        puts "You will also be given a random location"
        puts "With this information you may create any story you’d like!"
        puts "*------------------------------------------------------------------*"
        mini_menu
    end 

    def mini_menu
        system "clear"
        5.times do puts "" end
        mini_menu = prompt.select "Please choose from the following options", "Create Your Story!","Go to Main Menu","Exit"
        case mini_menu
        when "Create Your Story!"
            story_info
        when "Go to Main Menu"
            main_menu
        when "Quit"
            exit
        end
    end

    def story_info
        puts "Here are your 3 characters:"
        puts "**************************"
        sleep 1
        random_characters
        puts "****************************"
        sleep 1
        puts "Here are some traits you can use:"
        puts "***************************"
        sleep 1
        random_traits
        puts "***************************"
        sleep 1
        puts "Here's your destination:"
        puts "***************************"
        sleep 1
        random_location
        puts "-----------------------------------"
    end

    def random_characters
        @@creatures = Creature.random_name
        puts @@creatures       
    end

    def random_traits
        randomized_traits = Trait.all_traits
        @@traits = randomized_traits.sample(3)
        puts @@traits
    end

    def random_location
        # all_location = Location.all_locations
        single_location = Location.all_locations.sample
        # destiny_location = single_location.name   
        story_location = single_location.name
        puts story_location
        # puts destiny_location
        
        create_story(single_location)#calls next method
    end

    def create_story(single_location)
        story_title = prompt.ask("What is the title of your story?")
        story_content = prompt.ask("Write your magical story")
        new_story = Story.create(:title=>"#{story_title}", :content=>"#{story_content}", :user_id=>"#{@current_user.id}", :location_id=>"#{single_location.id}")
        # binding.pry
        @@creatures = []
        story_options = prompt.select("Thats beautiful work! Your story has now been created; please select from the following options:","View your stories here!", "Back to Main Menu")
        if story_options == "View your stories here!"
            user_stories
        else story_options == "Back to Main Menu"
            main_menu
        sleep 1
        end 
    end

    def main_menu
        system "clear"
        5.times do puts "" end
        main_menu = prompt.select("Please select from the following", "Create Story!","Your Stories", "The Bookshelf","Character Profiles","Create a Character","Quit")
        case main_menu
        when "Create Story!"
            instructions
        when "Your Stories"
            user_stories
        when "The Bookshelf"
            location_stories
        when "Character Profiles"
            all_creatures_in_app
        when "Create a Character"
            create_character
        when "Quit"
            exit
        end
    end
  
    def option_drop_down(user_all_stories_title)
        select_story = prompt.select("Pick a story", [user_all_stories_title])
        story = Story.find_by(title: select_story)
        select_content = story.content
        puts "#{select_content}"
        story_option = prompt.select("Would you like to edit or delete this story", ["Edit", "Delete", "Go back to Main Menu"])
        story = Story.find_by(title: select_story)
        if story_option == "Edit"
            user_content = prompt.ask "Edit your story"
            story.update(content: user_content)
            prompt.ok("Your story has now been updated")
        # add story title choice with a boolean. 
        sleep 1
        main_menu 
        elsif story_option == "Delete"
            Story.destroy(story.id)
            prompt.ok("Story has now been deleted, you will now be taken back to Main Menu")
            sleep 3
            main_menu
        else story_option == "Go Back to Main Menu"
            main_menu
        end
    end

    def user_stories
        user_all_stories = Story.where(user_id: @current_user).select { |story| story.title != "" }
        user_all_stories_title = user_all_stories.map{|story| story.title}
        if user_all_stories_title.count > 0 
        option_drop_down(user_all_stories_title)        
        else
            puts "You have 0 stories :("
            sleep 3
            main_menu
        end
    end

    def location_stories 
        list_of_locations = Story.location_n #returns individual locations na
        chosen_location = prompt.select("Choose location", list_of_locations)
        stories_of_location = Location.find_by(name: chosen_location).stories
        location_stories = stories_of_location.map { |story| story.title}
        # puts location_stories
        #now to get the content for the titles
         chosen_title = prompt.select("View a Story", location_stories)
         story = Story.find_by(title: chosen_title)
        #  binding.pry
         select_content = story.content
         puts "#{select_content}"
        option = prompt.select("You can either:", "Go Back to Main Menu!","Or Quit!")
        if option == "Go Back to Main Menu!"
            main_menu
        else option == "Or Quit!"
            exit
        end 
    end

    def create_character
        created_character = prompt.ask("Create your creature...")
        character_age = prompt.ask("How old is your character")
        character_weapon = prompt.ask("What's their weapon")
        new_creature = Creature.create(:creature=>"#{created_character}", :age=>"#{character_age}", :weapon=>"#{character_weapon}")
        @@creatures = []
        creature_options = prompt.select("Thats beautiful work! Your character has now been created; please select from the following options:","View character profiles!", "Back to Main Menu")
          if creature_options == "View character profiles!"
            all_creatures_in_app
        else story_options == "Back to Main Menu"
            main_menu
        sleep 1
        end 
    end 

    def all_creatures_in_app
        creatures = Creature.all_creatures
        chosen_creature = prompt.select("Which creature would you like to view?", creatures)
        instance_of_creature = Creature.all.select{|creature| creature.creature == chosen_creature}
        creature_details = instance_of_creature.map{|creature| "Age: #{creature.age}, Weapon: #{creature.weapon}"}
        # binding.pry
        puts creature_details   
        option = prompt.select("You can either:", "Go Back to Main Menu!","Or Quit!")
        if option == "Go Back to Main Menu!"
            main_menu
        else option == "Or Quit!"
            exit
        end
        # creature_details = Creature.find_by
        # creature = Creature.find_by(creature: creature, age: age, weapon: weapon)
        #to print out all the names of the creatures
        #then be able to click into those names for more details
        #show a pic for each creature.
    end 
end 
