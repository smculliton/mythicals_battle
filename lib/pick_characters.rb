require './lib/character_gen'
require 'csv'

class CharacterPicker
  def initialize
    @classes = CSV.open("files/classes.csv", headers: true, header_converters: :symbol)
  end

  def pick_characters 
    prompt_one

    hash = class_hash
    hash.each { |index, cls| puts "#{index}: #{cls}"}

    cls = hash[player_cls(hash)]
    name = player_name(cls)

    prompt_two
    p [Character.new(name, cls, true), Character.new('evil computer', hash[rand(0..6)], false)]
  end 


  def class_hash
    hash = {}
    @classes.each_with_index do |cls, index|
      hash[index] = cls[:cls]
    end 
    hash
  end

  def player_cls(hash)
    num = gets.chomp.to_i
    until hash.keys.include?(num)
      puts 'enter a valid number'
      num = gets.chomp.to_i
    end
    num
  end

  def player_name(cls)
    puts `clear`
    puts "please name your #{cls}:"
    puts ''
    gets.chomp
  end

  def prompt_one
    puts `clear`
    puts 'pick your character:'
    puts ''
  end

  def prompt_two
    puts 'now enter the battle arena!!!'
  end
end

picker = CharacterPicker.new
picker.pick_characters