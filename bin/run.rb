require_relative '../config/environment'




prompt = TTY::Prompt.new()
system("clear")
welcome = "


          _____                   _____                   _____                   _____                  _______         
         /\\    \\                 /\\    \\                 /\\    \\                 /\\    \\                /::\\    \\        
        /::\\____\\               /::\\    \\               /::\\____\\               /::\\    \\              /::::\\    \\       
       /::::|   |              /::::\\    \\             /::::|   |              /::::\\    \\            /::::::\\    \\      
      /:::::|   |             /::::::\\    \\           /:::::|   |             /::::::\\    \\          /::::::::\\    \\     
     /::::::|   |            /:::/\\:::\\    \\         /::::::|   |            /:::/\\:::\\    \\        /:::/~~\\:::\\    \\    
    /:::/|::|   |           /:::/__\\:::\\    \\       /:::/|::|   |           /:::/  \\:::\\    \\      /:::/    \\:::\\    \\   
   /:::/ |::|   |          /::::\\   \\:::\\    \\     /:::/ |::|   |          /:::/    \\:::\\    \\    /:::/    / \\:::\\    \\  
  /:::/  |::|___|______   /::::::\\   \\:::\\    \\   /:::/  |::|   | _____   /:::/    / \\:::\\    \\  /:::/____/   \\:::\\____\\ 
 /:::/   |::::::::\\    \\ /:::/\\:::\\   \\:::\\    \\ /:::/   |::|   |/\\    \\ /:::/    /   \\:::\\ ___\\|:::|    |     |:::|    |
/:::/    |:::::::::\\____/:::/  \\:::\\   \\:::\\____/:: /    |::|   /::\\____/:::/____/  ___\\:::|    |:::|____|     |:::|    |
\\::/    / ~~~~~/:::/    \\::/    \\:::\\  /:::/    \\::/    /|::|  /:::/    \\:::\\    \\ /\\  /:::|____|\\:::\\    \\   /:::/    / 
 \\/____/      /:::/    / \\/____/ \\:::\\/:::/    / \\/____/ |::| /:::/    / \\:::\\    /::\\ \\::/    /  \\:::\\    \\ /:::/    /  
             /:::/    /           \\::::::/    /          |::|/:::/    /   \\:::\\   \\:::\\ \\/____/    \\:::\\    /:::/    /   
            /:::/    /             \\::::/    /           |::::::/    /     \\:::\\   \\:::\\____\\       \\:::\\__/:::/    /    
           /:::/    /              /:::/    /            |:::::/    /       \\:::\\  /:::/    /        \\::::::::/    /     
          /:::/    /              /:::/    /             |::::/    /         \\:::\\/:::/    /          \\::::::/    /      
         /:::/    /              /:::/    /              /:::/    /           \\::::::/    /            \\::::/    /       
        /:::/    /              /:::/    /              /:::/    /             \\::::/    /              \\::/____/        
        \\::/    /               \\::/    /               \\::/    /               \\::/____/                ~~              
         \\/____/                 \\/____/                 \\/____/                                                         
                                                                                                                         



Welcome to Mango Jobs. We'll help you find your career in the tech world, no matter where you are.\n
"

puts welcome

#TODO Ask the user what they are: candidate or company
#TODO Make CLI return back to main menu after every result

#List the features of the app: array
features = [
  "Search Position by Title", 
  "Search Position by Company", 
  "Search Position by Location", 
  "Search for all Positions Within the last 5 Days",
  "Search Position by Skill",
  "Apply to Position",
  "Exit"

]

choice = 0

while choice != features[6]
  choice = prompt.select("Choose what you would like to do:", features, per_page: 8)
  positions = [] 

  if choice == features[0]
    keywords = prompt.ask("What kind of jobs would you like to search for?").downcase.split()
    keywords.each do |keyword|
      positions += Position.search_title(keyword)
    end
    positions.uniq!
    positions.each {|pos| puts pos.title + " " + pos.location}
      
  elsif choice == features[1]
    keywords = prompt.ask("What's the name of the company you would like to search for?").downcase.split()
    keywords.each do |keyword|
      positions += Position.search_company(keyword)
    end
    positions.uniq!
    positions.each {|pos| puts pos.title + " " + pos.company.name}
  elsif choice == features[2]
    keywords = prompt.ask("What location would you like to search for?").downcase.split()
    keywords.each do |keyword|
      positions += Position.search_location(keyword)
    end
    positions.uniq!
    positions.each {|pos| puts pos.title + " " + pos.location}
  elsif choice == features[3]
    puts "Here are positions created in last 5 days: "
    positions = Position.search_recent_positions
    positions.uniq!
    positions.each {|pos| puts pos.title + " " + pos.location}
  elsif choice == features[4]
    keywords = prompt.ask("What skill would you like to search for?").downcase.split()
    keywords.each do |keyword|
      positions += Position.search_skill(keyword)
    end
    positions.uniq!
    positions.each {|pos| puts pos.title + " " + pos.location}
  elsif choice == features[5]
    #TODO Apply to position
  else
    #repeat choices
    #add loop to return to main menu
  end

  puts

end





# name = prompt.ask("What is your name?")
# gpa = prompt.ask("What is your gpa?").to_f
# 
# positions = Position.all.select do |pos|
#   t = pos.title.downcase
#   keywords.any? {|word| t.include?(word)}
# end
# positions.each {|pos| puts pos.title + " " + pos.location}