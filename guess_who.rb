require 'yaml'
require 'rspec'

class Person
  attr_accessor :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def has_attribute?(key, value)
    @attributes[key] == value
  end

  def to_s
    "#{@attributes['name']} is a #{@attributes['gender']} with #{@attributes['eye']} eyes, #{@attributes['hair']} hair, and #{@attributes['skin']} skin."
  end
end

class GuessWhoGame
  NUM_CHANCES = 5
  @@people = YAML::load(File.read 'people.yml').map{ |p| Person.new(p) }

  attr_accessor :num_guesses, :person

  def initialize
    @num_guesses = 0
    @people_left = @@people.dup
    @person = @people_left.sample
    while play
    end
  end

  def play
    print_summary

    (attribute, value) = ask_for_guess

    if determine_answer(attribute,value)
      puts "Yes! This person's #{attribute} is #{value}!"
      filter_people_left_for_true(attribute, value)
    else
      puts "No! This person's #{attribute} is not #{value}!"
      filter_people_left_for_false(attribute, value)
    end

    if @people_left.count == 1
      puts "YAY! The person was #{@person.attributes['name']}! YOU WIN!"
      return false
    else
      @num_guesses += 1
      if @num_guesses >= NUM_CHANCES
        puts "Sorry, better luck next time."
        return false
      end
    end
    return true
  end

  def ask_for_guess
    puts "What attribute would you like to guess about? (#{@people_left.first.attributes.keys.join(', ')})"
    key = gets.chomp
    puts "What value will you guess?"
    value = gets.chomp
    return key, value
  end

  def determine_answer(key, value)
    @person.has_attribute?(key, value)
  end

  def print_summary
    @people_left.each { |p| puts p }
  end

  def filter_people_left_for_true(key, value)
    @people_left.select!{ |p| p.has_attribute?(key, value) }
  end

  def filter_people_left_for_false(key, value)
    @people_left.select!{ |p| !p.has_attribute?(key, value) }
  end
end


g = GuessWhoGame.new



RSpec.describe do
  describe Person do

  end

  describe GuessWhoGame do

  end
end
