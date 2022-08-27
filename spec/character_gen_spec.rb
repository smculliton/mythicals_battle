require 'rspec'
require '../lib/character_gen'
require 'pry'
# require '../lib/classes.csv'

RSpec.describe Character do 
    describe '#initialize' do 
        before(:each) do 
            @unicorn = Character.new('sprinkles', 'unicorn', true)
        end 
        it 'has a name' do 
            expect(@unicorn.name).to eq('sprinkles')
        end 
        it 'has a class' do 
            expect(@unicorn.cls).to eq('unicorn')
        end 
        it 'has an empty base stats hash' do
            expect(@unicorn.base_stats).to eq({})
        end 
        it 'has an empty stats hash' do 
            expect(@unicorn.stats).to eq({})
        end 
        it 'is a human player or not' do 
            expect(@unicorn.human_player?).to eq(true)
        end
        it 'starts at level 0' do 
            expect(@unicorn.lvl).to eq(0)
        end 
        it 'starts with an empty movset' do
            expect(@unicorn.mvset).to eq([])
        end 
    end 
    describe '#import_cls' do 
        before(:each) do 
            @unicorn = Character.new('sprinkles', 'unicorn', true)
        end 
        it 'opens classes.csv' do 
            
        end 
        it 'populates base stats' do
            @unicorn.import_cls 
            expect(@unicorn.base_stats).to eq({hlt: 4, man: 2, atk: 2, dfs: 4, mgc: 2, spd: 1})
        end 
        it 'imports moveset' do 
            @unicorn.import_cls
            expect(@unicorn.mvset).to eq(['sparkle', 'hornjab'])
        end 
    end 
    describe '#calculate_stats' do 
        before(:each) do 
            @unicorn = Character.new('sprinkles', 'unicorn', true)
        end 
        it 'populates stats' do 
            @unicorn.import_cls
            @unicorn.calculate_stats
            expected = @unicorn.stats.keys.all? do |stat|
                [:hlt, :man, :atk, :dfs, :mgc, :spd, :acc, :xp].one? { |test| test == stat }
            end 
            expect(expected).to eq(true)
        end
        it 'stats are appropriate values' do 
            @unicorn.import_cls
            @unicorn.calculate_stats
            expected = @unicorn.stats.all? do |stat, value| 
                if stat == :hlt || stat == :man || stat == :acc 
                    value > 15
                elsif stat == :acc
                    value = 100
                elsif stat == :xp
                    value = 0
                else stat
                    value >= 5 && value <= 13
                end
            end 
            expect(expected).to eq(true)
        end 
    end
end 
