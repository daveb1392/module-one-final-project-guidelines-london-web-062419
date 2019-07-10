require "pry"
class UserInterface

    attr_reader :prompt, :current_user

    @@creatures = []

    def initialize
        @current_user = nil
        @prompt = TTY::Prompt.new
    end 

    # def new_user
    #     @current_user = User.find_or_create_by(username: username)

    # end

    def greet
        puts "Welcome to Story2Go, if you love creating stories, you’re in the right place!"
        existing_user = prompt.select("Do you have an account with us?", %w(Yes No))
            if  existing_user == "Yes"
                username_login
            else existing_user == "No"
                # username = prompt.ask('Please create your username?', default: 'Anonymous')
                @current_user = create_user
                # password = prompt.mask('Please enter a password', symbols: {mask:bat})
                puts "Your account has been created"
                sleep 1
                second_greeting
            end 
        end 

         def username_login
            #find the user
            #no duplicate usernames
            #validate their password
            bat = prompt.decorate(prompt.symbols['U+1F987'])
            user_info = prompt.collect do 
                key(:username).ask('Please enter your username:', require: true)
                # key(:password).ask('Please enter your password:', require: true)
                key(:password).mask('Please enter your password', symbols: {mask: bat})
            end 
            user = User.where(username: user_info[:username], password: user_info[:password]).last
            if user.nil?
                sleep 1
                error_login
            else 
                puts "You're now logged in! "
                @current_user = user
                second_greeting
            end
            # prompt.mask('Please enter your password', symbols: {mask: bat})
         end 

            def error_login
                error = prompt.select("Wrong login details! Please try again!", "Retry login", "Quit")
                sleep 1 
                
            case error   
                when "Retry login"
                        username_login
                when  "Quit"
                        exit
                end

            end


            
        #     case login
                
        #     when user.nil?
             
        #     prompt.select("Wrong login details! Please try again!", "Retry login", "Quit")
        #         sleep 2 
                
        #     when "Retry login"
        #         username_login
        #     when "Quit"
        #         exit
                
        #     when user.valid?
        #     puts "You're now logged in! "
        #         @current_user = user
        #         second_greeting
        #     end
        #     # prompt.mask('Please enter your password', symbols: {mask: bat})
        #  end 

         def create_user
            bat = prompt.decorate(prompt.symbols["U+1F987"])
            user_creds = prompt.collect do
                key(:username).ask('Please enter a username:', required: true)
                key(:password).mask('Please enter a password:', symbols: {mask: bat})
         end 
            @current_user = User.create(**user_creds)
            @current_user.save
            second_greeting
        end 

    def second_greeting

        puts "Hello, #{@current_user.username}."
        "Instructions:
        You will be given three random characters,
        You will also be given a random location
        With this information you may create any story you’d like!"
        puts "*------------------------------------------------------------------*"
        mini_menu
    end 

    def mini_menu
        mini_menu = prompt.select "Please choose from the following options", "Move onto the next phase","Go to Main Menu","Exit"


        case mini_menu
        when "Move onto the next phase"
            next_phase
        when "Go to Main Menu"
            main_menu
        when "Quit"
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
        all_characters = Creature.all
        @@creatures = all_characters.sample(3)
        puts @@creatures.map{|char| char.creature}
        
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
        #add and save to db
        new_story = Story.create(:title=>"#{story_title}", :content=>"#{story_content}", :user_id=>"#{@current_user.id}", :location_id=>"#{single_location.id}")
        @@creatures = []
        main_menu
        
    end

    
    def main_menu
        system "clear"
        15.times do puts "" end
        main_menu = prompt.select("Please select from the following", "Your Stories", "Location Stories", "Quit")

        case main_menu

        when "Your Stories"
            user_stories
        when "Location Stories"
            location_stories
        when "Quit"
            exit
        end

        #this will have user
        # 1.user_story_edit # ??
        # 2. user_story_delete #destroy
        # 3. Location story # add a hint find_by name
        # 4.exit
    end
  
    def option_drop_down(user_all_stories_title)
        select_story = prompt.select("Pick a story", [user_all_stories_title])
        # user_content = @current_user.all_user_content
        story = Story.find_by(title: select_story)
        select_content = story.content
        puts "#{select_content}"
        story_option = prompt.select("Would you like to edit or delete this story", ["Edit", "Delete", "Go back"])
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
            prompt.ok("Story has now been deleted, back to Main Menu")
            sleep 1
            main_menu
        else story_option == "Go Back"
            main_menu
        end
    end



    def user_stories
        user_all_stories = Story.where(user_id: @current_user).select { |story| story.title != "" }
        user_all_stories_title = user_all_stories.map{|story| story.title}
        # @current_user.stories.each do |story| 
        #     puts story.title
        #  end

        if user_all_stories_title.count > 0 
        option_drop_down(user_all_stories_title) 
       
        else
            puts "You have 0 stories :("
            sleep 1
            main_menu
        end
    end

    def location_stories 
        # Location.all_location_names
      
        list_of_locations = Story.all.map{|story| story.location.name}.uniq #returns individual locations name

        chosen_location = prompt.select("Choose location", list_of_locations)

        stories_of_location = Location.find_by(name: chosen_location).stories
        location_stories = stories_of_location.map { |story| story.title}
        # puts location_stories

        #now to get the content for the titles
         chosen_title = prompt.select("View a Story", location_stories)

         story = Story.find_by(title: location_stories)
         select_content = story.content
         puts "#{select_content}"

        option = prompt.select("You can either:", "Go Back","Or Quit!")
        if option == "Go Back"
            main_menu
        else option == "Or Quit!"
            exit
        end 
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


end 
