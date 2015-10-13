require 'yaml'
require 'rspec'

class Person
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
    print_summary
  end

  def print_summary
    @people_left.each { |p| puts p }
  end

  def guess(key, value)
    
    @num_guesses += 1
  end

end


g = GuessWhoGame.new



RSpec.describe do
  describe Person do

  end

  describe GuessWhoGame do

  end
end

