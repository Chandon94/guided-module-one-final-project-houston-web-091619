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

        current_requester = Mission.create({
            title: title,
            tier: tier,
            cost: cost,
            status: status,
            ninja_id: ninja_id,
            requester_id: current_requester.id
        })
    end

        
        
        
    end
end
