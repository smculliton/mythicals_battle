#make moves instances into Modules???
# require_relative './specials'

class Move 
  attr_reader :name, :atk_dmg, :spec, :crit, :attacking, :acc, :physical_atk
  # include Specials
  
  def initialize(move)
    @name = move[:name]
    @atk_dmg = move[:atk_dmg]
    @spec = move[:special]
    @attacking = move[:attacking]
    @crit = move[:crit]
    @acc = move[:acc]
    @physical_atk = move[:phys]
  end 
  
  def attacking?
    attacking
  end 
   
  def calc_dmg(atkr, defr)
    self.special(atkr, defr) if @spec != nil
    return 0 if attacking? == false
    if phys?
      atk_pwr = atkr.stats[:atk] + atkr.atk_bonus + @atk_dmg
      dfs_pwr = defr.stats[:dfs] + defr.dfs_bonus
    else
      atk_pwr = atkr.stats[:mgc] + atkr.mgc_bonus + @atk_dmg
      dfs_pwr = defr.stats[:mgc] + defr.mgc_bonus
    end
    dmg = rand((atk_pwr - atk_pwr/5)..(atk_pwr + atk_pwr/5)) - rand((dfs_pwr - dfs_pwr/5)..(dfs_pwr + dfs_pwr/5))
    dmg = 1 if dmg <= 0
    puts "#{atkr.name} does #{dmg} damage"
    defr.stats[:hlt][0] -= dmg 
    return dmg
  end 

  def phys?
    physical_atk
  end 

  def crit_hit?
    (0..10).include?(rand(0..100))
  end 

  def attacking?
    attacking
  end 

end 


# teeth = Move.new ( { name: 'teeth', atk_dmg: 5, mgc_dmg: 1, spec: nil, attackin: false, crit: 0 } ) 