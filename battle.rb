require_relative 'character_lib'
require_relative 'turn'

class Battle 
  attr_reader :player1, :player2
  
  def initialize(plyrs)
    @plyrs = plyrs
    @plyr1 = @plyrs[0]
    @plyr2 = @plyrs[1]
    @turns = []
    battle_order
  end 
  
  def battle_order 
    battle_display
    turn_order
    @turns = move_selector
    battle_display
    @turns.each do |turn|  
      Turn.new(turn)
      gets.chomp
      return game_over if game_over?
      battle_display 
    end
    battle_order
  end 
  
  def game_over?
    @plyr1.stats[:hlt][0] <= 0 || @plyr2.stats[:hlt][0] <= 0
  end 
  
  def game_over
    return puts "#{@plyr1.name} wins!" if @plyr2.stats[:hlt][0] <= 0
    puts "#{@plyr2.name} wins!"
  end 
  
  def move_selector
    mvs_selected = []
    @plyrs.each do |plyr|
      if plyr.human?
        puts "#{plyr.name} action?"
        mvs_selected << [@plyrs.find { |atkr| plyr != atkr }, gets.chomp.to_i ]
      else
        mvs_selected << [@plyrs.find { |atkr| plyr != atkr }, rand(0..(plyr.mvset.length - 1)) ]
      end 
    end 
    @plyrs.zip(mvs_selected)
  end 
  
  def turn_order
    @plyrs.sort_by! { |player| -player.stats[:spd] + rand(2) }
  end 
  
  def battle_display
    puts `clear`
    puts (@plyr2.name + ' the ' + @plyr2.cls).rjust(70, (@plyr1.name + ' the ' + @plyr1.cls).ljust(70)).insert(-36, 'VS.')
    puts "level #{@plyr2.lvl}".rjust(73, "level #{@plyr1.lvl}".ljust(73))
    puts "health:".rjust(73, "health:".ljust(73))
    puts "#{@plyr2.stats[:hlt][0]}/#{@plyr2.stats[:hlt][1]}".rjust(73, "#{@plyr1.stats[:hlt][0]}/#{@plyr1.stats[:hlt][1]}".ljust(73))
    # puts "mana:".rjust(63, "mana:".ljust(63))
    # puts "#{@plyr2.stats[:man][0]}/#{@plyr2.stats[:man][1]}".rjust(63, "#{@plyr1.stats[:man][0]}/#{@plyr1.stats[:man][1]}".ljust(63))
    puts " "
    @plyr1.mvset.each do |move|
      puts "#{@plyr1.mvset.index(move)}: #{move.name}"
    end 
    puts " "
  end
  
end

battle = Battle.new(pick_characters)
#battle = Battle.new([Hobbit.new(true, 'dingo'), Werewolf.new(false, 'dracs')])