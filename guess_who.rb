require 'yaml'
require 'rspec'

class GuessWhoGame
  @@people = YAML::load(File.read 'people.yml')

  attr_accessor :num_guesses, :person

  def initialize
    @num_guesses = 0
    @person = @@people.sample
  end



end



RSpec.describe do

end

