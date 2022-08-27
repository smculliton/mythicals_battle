require 'csv'
require 'pry'

class Character
    attr_reader :name, :cls, :lvl, :human_player, :base_stats, :stats, :mvset

    def initialize(name, cls, human_player) 
        @name = name 
        @cls = cls 
        @lvl = 0
        @human_player = human_player
        @base_stats = {}
        @stats = {}
        @mvset = []
    end 

    def import_cls
        file = CSV.open("files/classes.csv", headers: true, header_converters: :symbol)
        cls_stats = file.find { |row| row[:cls] == @cls }
        cls_stats.each do |stat, value|
            next if stat == :cls
            return @mvset = cls_stats[stat].split(' ') if stat == :mvset 
            @base_stats[stat] = value.to_i
            # binding.pry
        end
    end

    def calculate_stats
        @base_stats.each do |stat, value|
            if stat == :hlt || stat == :man
                @stats[stat] = value * 10
            else
                @stats[stat] = rand(5..(5 + value))
            end 
            @stats[:acc] = 100 
            @stats[:xp] = 0
        end 
    end

    def human_player?
        @human_player
    end 

end 

unicorn = Character.new('sprinkles', 'unicorn', true)
unicorn.import_cls