require 'csv'
require 'pry'

class Character
    attr_reader :name, :cls, :lvl, :human_player, :base_stats, :stats, :mvset

    def initialize(name, cls, human_player) 
        @name = name 
        @cls = cls 
        @lvl = 1
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

    def display_stats
        puts `clear`
        puts "          --~*  #{@name} the #{@cls}  *~--          "
        puts "                        lvl #{lvl}"
        puts " "
        puts "      hlt     man     atk     dfs     mgc    spd"
        @stats.each { |stat, value| print value.to_s.rjust(8) unless stat == :acc || stat == :xp }
        puts " \n\n"
        puts "   experience: #{@stats[:xp]}"
        puts "   level up at: 0000000 \n\n"
        puts "   moveset:"
        @mvset.each { |move| puts "       #{move}"}
        gets.chomp
    end

    def human_player?
        @human_player
    end 

end 

unicorn = Character.new('sprinkles', 'unicorn', true)
unicorn.import_cls
unicorn.calculate_stats
unicorn.display_stats