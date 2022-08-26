require_relative 'moves'

class Vampire 
  attr_reader :name, :stats, :mvset, :human_player, :atk_bonus, :dfs_bonus, :mgc_bonus, :cls, :lvl 
  attr_accessor :name, :human_player
  
  def initialize (human_player, name = 'dracula')
    @name = name 
    @cls = 'vampire'
    @lvl = 1
    @growth = {hlt: 1, man: 3, atk: 1, dfs: 2, mgc: 4, spd: 2}
    @stats = @growth.map { |stat, val| [stat, rand(5..(5+val))] }.to_h
    @stats[:hlt] = [@stats[:hlt]*10, @stats[:hlt]*10]
    @stats[:man] = [@stats[:man]*10, @stats[:man]*10]
    @stats[:acc] = 100
    @stats[:xp] = 0
    @mvset = []
    @mvset << Move.new(teeth) << Move.new(hellfire)
    @status = []
    @human_player = human_player
    @atk_bonus = 0
    @dfs_bonus = 0
    @mgc_bonus = 0
  end 
  
  def teeth
    { name: 'teeth', atk_dmg: 5, mgc_dmg: 1, special: nil, crit: 0, acc: 100, attacking: true, phys: true }
  end
  
  def hellfire 
    { name: 'hellfire', atk_dmg: 10, mgc_dmg: 1, special: nil, crit: 0, acc: 65, attacking: true, phys: false }
  end 
  
  def human?
    human_player
  end 
end 

class Unicorn 
  attr_reader :name, :stats, :mvset, :human_player, :atk_bonus, :dfs_bonus, :mgc_bonus, :cls, :lvl
  attr_accessor :name, :human_player
  
  def initialize (human_player, name = 'sprinkles')
    @name = name 
    @cls = 'unicorn'
    @lvl = 1
    @growth = {hlt: 4, man: 2, atk: 2, dfs: 4, mgc: 2, spd: 1}
    @stats = @growth.map { |stat, val| [stat, rand(5..(5+val))] }.to_h
    @stats[:hlt] = [@stats[:hlt]*10, @stats[:hlt]*10]
    @stats[:man] = [@stats[:man]*10, @stats[:man]*10]
    @stats[:acc] = 100
    @stats[:xp] = 0
    @mvset = []
    @mvset << Move.new(sparkle) << Move.new(horn_jab)
    @status = []
    @human_player = human_player
    @atk_bonus = 0
    @dfs_bonus = 0
    @mgc_bonus = 0
  end 
  
  def sparkle
    { name: 'sparkle', atk_dmg: 6, special: nil, crit: 0, acc: 100, attacking: true, phys: false }
  end

  def horn_jab
    { name: 'horn jab', atk_dmg: 9, special: nil, crit: 0, acc: 80, attacking: true, phys: true }
  end 

  def human?
    human_player
  end 
end 

class Werewolf 
  attr_reader :name, :stats, :mvset, :human_player, :cls, :lvl 
  attr_accessor :name, :human_player, :atk_bonus, :dfs_bonus, :mgc_bonus
    
  def initialize (human_player, name = 'moony')
    @name = name 
    @cls = 'werewolf'
    @lvl = 1
    @growth = {hlt: 1, man: 2, atk: 4, dfs: 4, mgc: 1, spd: 3}
    @stats = @growth.map { |stat, val| [stat, rand(5..(5+val))] }.to_h
    @stats[:hlt] = [@stats[:hlt]*10, @stats[:hlt]*10]
    @stats[:man] = [@stats[:man]*10, @stats[:man]*10]
    @stats[:acc] = 100
    @stats[:xp] = 0
    @mvset = []
    @mvset << Move.new(bite) << Move.new(full_moon)
    @status = []
    @human_player = human_player
    @atk_bonus = 0
    @dfs_bonus = 0
    @mgc_bonus = 0
  end 
  
  def bite 
    { name: 'bite', atk_dmg: 5, mgc_dmg: 0, special: nil, crit: 0, acc: 100, attacking: true, phys:true }
  end 

  def full_moon
    { name: 'full moon', atk_dmg: 0, mgc_dmg: 0, special: 'full', crit: 0, acc: 100, attacking: false, phys: false }
  end 
  
  def human?
    human_player
  end 
end 

class Wizard
  attr_reader :name, :stats, :mvset, :human_player, :atk_bonus, :dfs_bonus, :mgc_bonus, :cls, :lvl 
  attr_accessor :name, :human_player  
    
  def initialize (human_player, name = 'merlin')
    @name = name 
    @cls = 'wizard'
    @lvl = 1
    @growth = {hlt: 3, man: 3, atk: 1, dfs: 1, mgc: 5, spd: 2}
    @stats = @growth.map { |stat, val| [stat, rand(5..(5+val))] }.to_h
    @stats[:hlt] = [@stats[:hlt]*10, @stats[:hlt]*10]
    @stats[:man] = [@stats[:man]*10, @stats[:man]*10]
    @stats[:acc] = 100
    @stats[:xp] = 0
    @mvset = []
    @mvset << Move.new(incantation) << Move.new(heal)
    @status = []
    @human_player = human_player
    @atk_bonus = 0
    @dfs_bonus = 0
    @mgc_bonus = 0
  end 
  
  def incantation 
    { name: 'incantation', atk_dmg: 7, special: nil, crit: 0, acc: 100, attacking: true, phys:false }
  end 

  def heal
    { name: 'heal', atk_dmg: 0, special: 'heal', crit: 0, acc: 100, attacking: false, phys:false }
  end 
  
  def human?
    human_player
  end 
end 

class Hobbit
  attr_reader :name, :stats, :mvset, :human_player, :atk_bonus, :dfs_bonus, :mgc_bonus, :cls, :lvl 
  attr_accessor :name, :human_player  
    
  def initialize (human_player, name = 'frodo')
    @name = name 
    @cls = 'hobbit'
    @lvl = 1
    @growth = {hlt: 3, man: 2, atk: 1, dfs: 3, mgc: 2, spd: 4}
    @stats = @growth.map { |stat, val| [stat, rand(5..(5+val))] }.to_h
    @stats[:hlt] = [@stats[:hlt]*10, @stats[:hlt]*10]
    @stats[:man] = [@stats[:man]*10, @stats[:man]*10]
    @stats[:acc] = 100
    @stats[:xp] = 0
    @mvset = []
    @mvset << Move.new(sneaky_swipes) << Move.new(magic_ring)
    @status = []
    @human_player = human_player
    @atk_bonus = 0
    @dfs_bonus = 0
    @mgc_bonus = 0
  end 
  
  def sneaky_swipes 
    { name: 'swipe', atk_dmg: 4, special: 'multi', crit: 0, acc: 100, attacking: true, phys:true }
  end 

  def magic_ring
    { name: 'magic ring', atk_dmg: 0, special: 'speed', crit: 0, acc: 100, attacking: false, phys:false }
  end 
  
  def human?
    human_player
  end 
end 

class Skeleton
  attr_reader :name, :stats, :mvset, :human_player, :atk_bonus, :dfs_bonus
  
  def initialize
    @name = "skeleton"
    @stats = {hlt: [20, 20], man: [0, 0], atk: 1, dfs: 2, mgc: 0, spd: 6, acc: 100}
    @mvset = []
    @mvset << Move.new(boney_swipe)
    @status = []
    @human_player = false
    @atk_bonus = 0
    @dfs_bonus = 0
  end 
  
  def boney_swipe
    { name: 'boney swipe', atk_dmg: 4, mgc_dmg: 0, special: nil, crit: 0, acc: 100 , attacking: true }
  end 
  
  def human?
    human_player
  end 
  
end 



# dracula = Vampire.new("dracula", true)
# skeleton = Skeleton.new 
# puts dracula.stats
# puts dracula.mvset[0].name
# puts skeleton.name 