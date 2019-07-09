require "pry"
class UserInterface

    attr_reader :prompt, :current_user

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
        sleep 1
        random_characters
        puts "****************************"
        sleep 1
        puts "Here's your destiny"
        puts "***************************"
        sleep 1
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
        single_location = all_location.sample
        destiny_location = single_location.name   
        puts destiny_location
        create_story(single_location)#call the next method. 
    end



    def create_story(single_location)
    
        story_title = prompt.ask("What the title of your story")
        story_content = prompt.ask("Write your magical story")
        # binding.pry
        #add and save to db
        new_story = Story.create(:title=>"#{story_title}", :content=>"#{story_content}", :user_id=>"#{@current_user.id}", :location_id=>"#{single_location.id}") 
        main_menu

    end

    
    def main_menu
        #this will have user
        # 1.user_story_edit # ??
        # 2. user_story_delete #destroy
        # 3. Location story # add a hint find_by name
        # 4.exit
    end

    # def story_index
    #     puts "--- story by you, #{@current_user.name} ---"
    #     # How to print out each story by user with an ID and a Title.
    #     @current_user.story.each do |story|
    #     puts "#{story.id}. #{story.title}"
    #     end
    # end

    # def story_show
    #     puts "Loading story #{last_input}..."
    #     # calling the users story
    #     if story = current_user.story.find_by(:id => )
    #     puts "--- #{story.id} --- #{story.title}"
    #     puts
    #     puts story.content
    #     else
    #     # rescue ActiveRecord::RecordNotFound
    #     puts "Can't find a story with ID #{last_input} for you..."
    # end
        
    # end


    # def user_input
    #     self.last_input = @prompt
    # end
binding.pry

end 
