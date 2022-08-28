require 'rspec'
require './lib/character_gen'
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
        it 'starts at level 1' do 
            expect(@unicorn.lvl).to eq(1)
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
    describe '#lvl_up' do 
        before(:each) do
            @unicorn = Character.new('sprinkles', 'unicorn', true)
            @unicorn.import_cls
            @unicorn.calculate_stats
        end
        it 'increases lvl by one' do
            @unicorn.lvl_up
            expect(@unicorn.lvl).to eq(2)
        end     
        it 'increases stats by growth rate' do
            og_atk = @unicorn.stats[:atk]
            @unicorn.lvl_up
            expected = (og_atk + 2)
            expect(@unicorn.stats[:atk]).to eq(expected)
        end 
        it 'increases hlt + man by growth rate * 10' do 
            og_hlt = @unicorn.stats[:hlt]
            og_man = @unicorn.stats[:man]
            @unicorn.lvl_up
            expected1 = og_hlt + (og_hlt/10 * 6)
            expected2 = og_man + (og_man/10 * 6)
            expect(@unicorn.stats[:hlt]).to eq(expected1)
            expect(@unicorn.stats[:man]).to eq(expected2)
        end 
    end 
    describe '#import mvset' do
        before(:each) do 
            @unicorn = Character.new('sprinkles', 'unicorn', true)
            @unicorn.import_cls
            @unicorn.import_mvset
        end 
        it 'opens moves.csv' do 
        end 
        it 'creates move classes for each move' do 
            expect(@unicorn.mvset[0]).to be_an_instance_of(Move)
        end 
        it 'finds the right moves for its class' do 
            expected = []
            @unicorn.mvset.each { |move| expected << move.name }
            expect(expected).to eq(['sparkle','hornjab'])
        end 
    end 
    describe '#learn_move' do 
        before(:each) do 
            @unicorn = Character.new('sprinkles', 'unicorn', true)
            @unicorn.import_cls
            @unicorn.learn_move("teeth")
        end
        it 'adds move to mvset' do 
            expect(@unicorn.mvset[0]).to be_a Move
            expect(@unicorn.mvset[0].name).to eq("teeth")
        end 
    end
end 
