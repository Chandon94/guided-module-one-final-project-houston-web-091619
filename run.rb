require_relative 'config/environment'
require 'tty-prompt'
require 'artii'
require 'pry'


prompt = TTY::Prompt.new
a = Artii::Base.new :font => 'slant'


# 100.times do |i|
#     progressbar.increment
  
#     if i == 72 
#       progressbar.format = "%t: |\e[31m%B\e[0m|"
#     end
  
#     sleep 0.1
# end

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

            user_response = "Login"
        end        

        if user_response == "Login"
            p "Please Login on your account"
            current_ninja = Ninja.where({
            name: prompt.ask("Enter your name:"),
            password: prompt.mask("Enter password:")
        })
        end

        while user_response = prompt.select("What would you like to do?",[
            "Check My Available Balance",
            "See My Missions And Update Status",
            "Exit" ])

            if user_response == "Exit"
                break
            end
            #options for the ninja goes here

        end

        
    end



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

            user_response = "Login"
        end        

        if user_response == "Login"
            p "Please Login on your account"
            current_requester = Requester.where({
            name: prompt.ask("Enter your name:"),
            password: prompt.mask("Enter password:")
        })
        end

        #options for the requester goes here

        while user_response = prompt.select("What would you like to do?",[
            "Create A Mission.",
            "See List Of Available Ninjas.",
            "Check Status Of My Current Missions.",
            "Exit" ])

            if user_response == "Exit"
                break
            end

            if user_response == "Create A Mission!"

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
        
                req = Requester.find_by(id: current_requester.id)
                new_value = req.funds - cost
                req.update(funds: new_value) 
                
                status = "Pending"
        
                # prompt.say('Choose a ninja to complete this misson')
                
                ninjas_hash = {}
                alive = Ninja.all.select do |alive|
                    alive.status == "Alive"
                end
                alive.each do |ninja|
                    ninjas_hash[ninja.name] = ninja.id
                end
        
                ninja_id = prompt.select("Choose a Ninja!", ninjas_hash)
        
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
        
                print "Mission succesfuly crated"
        
        
            end #create a mission end

        end
        
    end


end