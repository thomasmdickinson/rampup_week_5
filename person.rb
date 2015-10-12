class Person
  def initialize(name)
    @name = name.downcase
  end

  def name
    @name.upcase
  end

  def hi
    "Hi, #{self.name}"
  end

  def self.say_hello
    "Hello there"
  end

end

p = Person.new "Pete"


