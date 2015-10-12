## Credit to: testfirst.org/learnruby

class TemperatureValue
  attr_accessor :value

  def initialize(value)
    @value = value.to_f
  end
end

class Celsius < TemperatureValue
  def to_fahrenheit

  end

  def to_celsius

  end
end

class Fahrenheit < TemperatureValue
  def to_fahrenheit

  end

  def to_celsius

  end
end


class Temperature
  attr_accessor :value

  def initialize(args)
    if args[:f]
      @value = Fahrenheit.new args[:f]
    elsif args[:c]
      @value = Celsius.new args[:c]
    else
      raise ArgumentError
    end
  end

  def in_fahrenheit
    value.to_fahrenheit
  end

  def in_celsius
    value.to_celsius
  end
end


describe Temperature do

  describe "can be constructed with an options hash" do
    describe "in degrees fahrenheit" do
      it "at 50 degrees" do
        expect(Temperature.new(:f => 50).in_fahrenheit).to eq 50
      end

      describe "and correctly convert to celsius" do
        it "at freezing" do
          expect(Temperature.new(:f => 32).in_celsius).to eq 0
        end

        it "at boiling" do
          expect(Temperature.new(:f => 212).in_celsius).to eq 100
        end

        it "at body temperature" do
          expect(Temperature.new(:f => 98.6).in_celsius).to eq 37
        end

        it "at an arbitrary temperature" do
          expect(Temperature.new(:f => 68).in_celsius).to eq 20
        end
      end
    end

    describe "in degrees celsius" do
      it "at 50 degrees" do
        expect(Temperature.new(:c => 50).in_celsius).to eq 50
      end

      describe "and correctly convert to fahrenheit" do
        it "at freezing" do
          expect(Temperature.new(:c => 0).in_fahrenheit).to eq 32
        end

        it "at boiling" do
          expect(Temperature.new(:c => 100).in_fahrenheit).to eq 212
        end

        it "at body temperature" do
          expect(Temperature.new(:c => 37).in_fahrenheit).to be_within(0.1).of(98.6)
          # Why do we need to use be_within here?
          # See http://www.ruby-forum.com/topic/169330
          # and http://groups.google.com/group/rspec/browse_thread/thread/f3ebbe3c313202bb
          # Also, try "puts 0.5 - 0.4 - 0.1" -- pretty crazy, right?
        end
      end
    end
  end

end
