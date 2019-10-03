require_relative 'config/environment'
require 'tty-prompt'
require 'artii'
require 'pry'

prompt = TTY::Prompt.new
a = Artii::Base.new :font => 'slant'

# progressbar = ProgressBar.create(format: "\e[0m%t: |%B|\e[0m")

# 100.times do |i|
#   progressbar.increment

#   if i == 72 
#     progressbar.format = "%t: |\e[31m%B\e[0m|"
#   end

#   sleep 0.1
# end
puts a.asciify('Welcome To Baby Daddy Online!!!')



current_requester = nil

while current_requester == nil
    p "Welcome To The Dark Web!!!"

    requesters_response = prompt.select("Choose your path:",[
        "Sign Up",
        "Login"
    ])
    

    if requesters_response == "Sign Up"
        name = prompt.ask('What is your name?')
        password = prompt.ask('Enter Password')
        village = prompt.ask('What village are you apart of?')
        funds = prompt.ask('How much funds do you currently have?')
        current_requester = Requester.create({
            name: name,
            password: password,
            village: village,
            funds: funds
        })
    end

    if (requesters_response == "Login")
        current_requester = Requester.where({
            name: prompt.ask("Enter your name:"),
          password: prompt.mask("Enter password:")
        }).first 
    end
end



while
    requesters_response = prompt.select("Choose The Right Path: ",[
        "Create A Mission!",
        "Mission Status?",
        "Ninja Status?",
        "Where's all my ninjas bruh???",
        "Exit" ])


    if requesters_response == "Exit"
        break
    end

    if requesters_response == "Create A Mission!"
        
        title = prompt.ask("What's the title of the mission?")
<<<<<<< HEAD
        while title == nil
            title = prompt.ask("Please assign a title!")
        end

        tier = prompt.ask("Set the level of difficulty")
        cost = prompt.ask("How much cash are you willing to provide?")
        status = "Pending"
        prompt.say('Choose a Ninja!')

        ninjas_hash = {}
        Ninja.all.each do |ninja|
           ninjas_hash[ninja.name] = ninja.id
       end
       ninja_id = prompt.select("Choose a Ninja!", ninjas_hash)
=======
        while title == nil do
            title = prompt.ask("Please assign a name to the mission:")
        end
        tier = prompt.select("Set the level of difficulty",["A Easy","B Medium", "C Hard", "D Very hard", "S Extremely hard"])
        if tier == "A Easy"
            tier = "A"
            cost = 100
            p "The cost for this mission is $#{cost}"
            tier == "A"
        end
        if tier == "B Medium" 
            tier = "B"
            cost = 200
            p "The cost for this mission is $#{cost}"
        end
        if tier == "C Hard" 
            tier = "C"
            cost = 300
            p "The cost for this mission is $#{cost}"
        end
        if tier == "D Very hard" 
            tier = "D"
            cost = 400
            p "The cost for this mission is $#{cost}"
        end
        if tier == "S Extremely hard" 
            tier = "S"
            cost = 500
            p "The cost for this mission is $#{cost}"
            
            
          
        end

        req = Requester.find_by(id: current_requester.id)
            new_value = req.funds - cost
            req.update(funds: new_value) 

        
        status = "Pending"

        prompt.say('Choose a ninja to complete this misson')

        ninjas_hash = {}
        Ninja.all.each do |ninja|
            ninjas_hash[ninja.name] = ninja.id
        end

        ninja_id = prompt.select("Choose a Ninja!", ninjas_hash)

        # req = Requester.find_by(id: current_requester.id)
        # # req = Requester.find(current_requester.id) # the object
        # new_value = req.funds - cost
        # req.update(funds: new_value) 

>>>>>>> 55b145e81869b965aa1a5f9f600eb53ded8e655c

        current_requester = Mission.create({
            title: title,
            tier: tier,
            cost: cost,
            status: status,
            ninja_id: ninja_id,
            requester_id: current_requester.id
        })


        # I was trying to substract the cost of the mission after it's created from the requester's fund
        # Requester.requesters.funds - cost 


        print "Mission succesfuly crated"


    end

<<<<<<< HEAD
        
        
        
    end
=======

    if requesters_response == "Mission Status?"

        
        #write code for mission status here



    end

>>>>>>> 55b145e81869b965aa1a5f9f600eb53ded8e655c
end
