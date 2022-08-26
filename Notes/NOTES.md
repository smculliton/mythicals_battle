#Battle.rb
1. Has a Battle Class 
  1. Attributes 
    1. Has an Array of fighters - generally one player and one computer character
  2. Methods
    1. Has a display that shows both/all members of the battle and their current health/ magic
    2. Move selector that allows player to pick their move, or computer player to randomly generate move 
    3. Battle order that executes all steps of the battle in order 
      1. Displays battle info, asks players to pick their moves 
      1. Both players select their moves
      2. Executes faster player's turn
      3. Checks if the battle has ended 
      4. Displays info after first turn
      5. Executes slower player's turn
      6. Checks if the battle has ended 
      7. Displays info after second turn
    4. Battle over method stops the battle when one character is at 0 health and declares a winner 
    
2. Has a Turn Class 
  1. Attributes 
    1. Has an active player (taking action)
    2. Has a passive player (receiving damage/action)
  2. Methods 
    1. Turn order 
      1. Checks for beginning of turn statuses (sleep, paralysis), resolves action
      2. Uses move accuracy to determine if the move is successful 
      2. Executes active player's selected move 
      3. Calculates damage inflicted on both/ either party
      4. Changes statuses for either player
      5. Checks/ resolves end of turn statuses 
    2. Damage calculator - calculates damage based on move used and player's stats 
    3. Status Checker - Checks if there are any statuses that would affect turn, resolves action 
    
#Characters.rb
1. Contains a Class for every playable characters
  1. Attributes 
    1. Current Level
    2. Stats Hash
      1. Current Health / Total Health 
      2. Current Mana / Total Mana 
      3. Attack / Attack Bonus
      4. Defense / Defense Bonus
      5. Magic 
      6. Speed
      7. Accuracy - (always 100, affected by moves/status)
      8. Experience
    3. Growth Rate Hash - same keys as Stats (except experience), values determine how quickly each stat grows as character levels up
    4. Moveset array - contains all techniques the character knows currently
    5. Wearables
      1. Armor - adds to defense bonus 
      2. Weapons - adds to attack bonus / magic 
    6. Regular items 
      1. Potions, etc.
    7. Purse of money 
  2. Methods 
    1. Move selector - takes in argument of move string from battle, and executes appropriate move in move set 
    2. All character moves 
      1. Take in argument of character and enemy character 
        1. changes statuses of characters involved 
        2. returns damage counter based on move strength and character stats 
        3. have an accuracy
    3. level up method 
      1. increases character level by one
      2. upgrades stats by growth rates 
      3. learns new techniques 
      
# Move.rb
1. has Move class that stores all the moves that any creature could learn
1. eventually need to be able to power up moves as levels increase