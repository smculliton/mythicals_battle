require_relative 'character_lib'

class Turn 
  def initialize(turn)
    @atkr = turn[0]
    @defr = turn[1][0]
    @move = @atkr.mvset[turn[1][1]]
    turn_order
  end 
  
  def turn_order
    beg_statuses
    puts "#{@atkr.name} uses #{@move.name}!!!"
    return puts "but they miss!!" if move_misses?
    @move.calc_dmg(@atkr, @defr)
    end_statuses
  end 
  
  def move_misses?
    hit = 0
    acc_rtng = @move.acc - @defr.stats[:spd]
    acc_rtng = 5 if acc_rtng < 5
    hit = rand(0..100)
    # return false if @move.acc == 100 
    return false if (0..(acc_rtng)).one? { |i| i == hit }
    true
  end 
  
  # def effect_calculator
  #   dmg = 0
  #   dmg = rand(@atkr.stats[:atk] - 2..@atkr.stats[:atk] + 2) + @atkr.atk_bonus + @move.atk_dmg - @defr.stats[:dfs] - @defr.dfs_bonus
  #   dmg = 1 if dmg <= 0
  #   @move.special(atkr, defr) if @move.spec != nil
  #   return 0 if @move.attacking? == false
  #   dmg *= 2 and puts "critical hit!" if crit_hit?
  #   puts "#{@atkr.name} does #{dmg} damage"
  #   @defr.stats[:hlt][0] -= dmg 
  #   return dmg
  # end 
    
  def beg_statuses
  end 
  
  def end_statuses
  end 
  
  def crit_hit?
    (0..10).include?(rand(0..100))
  end 
  
end 
    