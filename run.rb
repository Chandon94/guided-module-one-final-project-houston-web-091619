require_relative 'config/environment'
require 'tty-prompt'
require 'artii'
require 'pry'


prompt = TTY::Prompt.new
a = Artii::Base.new :font => 'slant'


progressbar = ProgressBar.create(format: "\e[0m%t: |%B|\e[0m")

100.times do |i|
  progressbar.increment

  if i == 25 
    progressbar.format = "%t: |\e[31m%B\e[0m|"
  end


  sleep 0.1
end

puts a.asciify('Welcome')

user = nil

while user == nil

    user_response = prompt.select("Choose your account type",[
        "Requester",
        "Ninja"
    ])


    if user_response == "Ninja"

        user_response = prompt.select("",[
        "Sign Up",
        "Login"
        ])


        if user_response == "Sign Up"
            name = prompt.ask('What is your name?')
            password = prompt.mask('Enter Password')
            clan = prompt.ask('What clan are you apart of?')
            village = prompt.ask('What village are you apart of?')
            rank = prompt.select("Select your ninja rank",[
                "Jōnin",
                "Genin",
                "Chūnin", 
                "Anbu"
                ])
            status = "Alive"
            bank = 0
            current_ninja = Ninja.create({
                name: name,
                password: password,
                clan: clan,
                village: village, 
                rank: rank, 
                status: status, 
                bank: bank
            })

            puts a.asciify("Account Successfully Created")

        end        

        if user_response == "Login"

            p "Please Login on your account"
            current_ninja = Ninja.find_by(name: prompt.ask("Enter your name:"))
            password_ninja = prompt.mask("Enter password:")

            while  password_ninja != current_ninja.password
                puts "Error Wrong Password! Try Again"
                # password_ninja != current_ninja.password
                password_requester = password_ninja = prompt.mask("Enter password:")
            end

        


        end

        while user_response = prompt.select("What would you like to do?",[
            "Check My Available Balance",
            "See My Missions And Update Status",
            "Exit" ])

            if user_response == "Exit"
                break
            end
            #options for the ninja goes 
            
            if user_response == "See My Missions And Update Status"
                # binding.pry
                if current_ninja.missions == []

                    
                    puts a.asciify("You have no missions")
                
                else
                    mission_status_array = current_ninja.missions.map do |mission|
                        mission.title
                    end 
                    
                 
                    new_status = prompt.select("Choose mission to be updated", mission_status_array)
    
                    if new_status == new_status
                        mission_option_status = ["Ongoing", "Pending", "Fail", "Completed"]
    
                        new_status_for_mission = prompt.select("Choose the new status for the mission", mission_option_status)
    
                        missioin_new_status_change = Mission.find_by(title: new_status)
                        missioin_new_status_change.update(status: new_status_for_mission)
    
                        puts a.asciify("New Mission Status Is #{new_status_for_mission}")
    
                    end
                end
              
                 
                
                

                 

            end #end of See My Missions And Update Status

            if user_response == "Check My Available Balance"

                current_ninja_id = Ninja.all.find do |ninja|
                    ninja.id == current_ninja.id
                end

                puts a.asciify("Current Balance is $#{current_ninja_id.bank}")

             end #end of Check My Available Balance

        end #end of the loop

        
    end

#  **************************************REQUESTERS************************************************************************


    if user_response == "Requester"

        user_response = prompt.select("",[
        "Sign Up",
        "Login"
        ])


        if user_response == "Sign Up"
            name = prompt.ask('What is your name?')
            password = prompt.mask('Enter Password')
            village = prompt.ask('What village are you apart of?')
            funds = prompt.ask('How much funds do you currently have?')
            current_requester = Requester.create({
                name: name,
                password: password,
                village: village,  
                funds: funds
            })

            puts a.asciify("Account Successfully Created")

        end        

        if user_response == "Login"
            p "Please Login on your account"
            current_requester = Requester.find_by(name: prompt.ask("Enter your name:"))
            password_requester = prompt.mask("Enter password:")

            while  password_requester != current_requester.password
                puts "Error Wrong Password! Try Again"
                # password_ninja != current_ninja.password
                password_requester = password_requester = prompt.mask("Enter password:")
            end
            
        end


        #options for the requester goes here

        while user_response = prompt.select("What would you like to do?",[
            "Create A Mission.",
            "See List Of All Available Ninjas.",
            "Check Status Of My Current Missions.",
            "Exit" ])

            if user_response == "Exit"
                break
            end

            if user_response == "Create A Mission."

                title = prompt.ask("What's the title of the mission?")

                while title == nil do
                    title = prompt.ask("Please assign a name to the mission:")
                end

                tier = prompt.select("Set the level of difficulty",["A Easy $100","B Medium $200", "C Hard $300", "D Very hard $400", "S Extremely hard $500"])
                if tier == "A Easy $100"
                    tier = "A"
                    cost = 100
                    p "The cost for this mission is $#{cost}"
                    tier == "A"
                end
                if tier == "B Medium $200" 
                    tier = "B"
                    cost = 200
                    p "The cost for this mission is $#{cost}"
                end
                if tier == "C Hard $300" 
                    tier = "C"
                    cost = 300
                    p "The cost for this mission is $#{cost}"
                end
                if tier == "D Very hard $400" 
                    tier = "D"
                    cost = 400
                    p "The cost for this mission is $#{cost}"
                end
                if tier == "S Extremely hard $500" 
                    tier = "S"
                    cost = 500
                    p "The cost for this mission is $#{cost}"
                    
                    
                  
                end
                
                status = "Pending"
                
                ninjas_hash = {}
                alive = Ninja.all.select do |alive|
                    alive.status == "Alive"
                end
                alive.each do |ninja|
                    ninjas_hash[ninja.name] = ninja.id
                end
        
                ninja_id = prompt.select("Choose a Ninja!", ninjas_hash)

                req = Requester.find_by(id: current_requester.id)
                new_value = req.funds - cost
                req.update(funds: new_value) 
        
                current_requester = Mission.create({
                    title: title,
                    tier: tier,
                    cost: cost,
                    status: status,
                    ninja_id: ninja_id,
                    requester_id: current_requester.id
                })
        
               
               
                nin = Ninja.find_by(id: ninja_id)
                pay_nin = nin.bank + cost
                nin.update(bank: pay_nin)

                puts a.asciify("Mission successfuly created")
        
        
            end #create a mission end

            if user_response == "See List Of All Available Ninjas."
                
                ninjas_hash = {}

                alive = Ninja.all.select do |alive|
                    alive.status == "Alive"
                end

                alive.each do |ninja|
                    ninjas_hash[ninja.name] = ninja.id
                end

                prompt.select("Choose a Ninja!", ninjas_hash)

            end # See list of all aviable nijas end
           

            if user_response == "Check Status Of My Current Missions."
                
            
                if current_requester.missions == []

                    puts a.asciify("You have no missions")

                else

                    
                    mission_hash_requester = {}
                    
                    mission_array_requester = current_requester.missions.map do |mission|
                        mission.title
                    end 

                    selected_mission = prompt.select("Choose the mission to see the current status", mission_array_requester)

                    requester_mission_instance = Mission.find_by(title: selected_mission)

                    puts a.asciify("#{requester_mission_instance.status}")

                end
                
                
            end # Check Status Of My Current Missions. end

        end
        
    end


end

