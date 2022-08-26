module Specials
    def special(atkr, defr)
        heal(atkr, defr) if @spec == 'heal'
        multi(atkr, defr) if @spec == 'multi'
        speed(atkr, defr) if @spec == 'speed'
        full(atkr, defr) if @spec == 'full'
    end 

    def heal(atkr, defr)
        atkr.stats[:hlt][0] += atkr.stats[:hlt][1]/8
        puts "healed #{atkr.stats[:hlt][1]/8} health"
    end 

    def multi(atkr, defr)
        dmg = rand(atkr.stats[:atk]..(atkr.stats[:atk] + 2)) - defr.stats[:dfs]
        dmg = 1 if dmg == 0
        puts "#{atkr.name} swipes at #{defr.name} and does #{dmg} damage"
        defr.stats[:hlt][0] -= dmg
        gets.chomp
        return multi(atkr, defr) if (0..(50 + atkr.stats[:spd])).include?(rand(0..100))
        puts "last swipe!.."
    end

    def speed(atkr, defr)
        puts "#{atkr.name} becomes quicker and sneakier!"
        atkr.stats[:spd] += 2
        # puts atkr.stats[:spd]
    end 
    
    def full(atkr, defr)
        puts "#{atkr.name} howls at the moon and gets stronger!"
        atkr.atk_bonus += 1
        atkr.dfs_bonus += 1
        atkr.mgc_bonus += 1
    end 

end