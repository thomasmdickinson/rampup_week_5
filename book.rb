require 'rspec'

## Credit to: testfirst.org/learnruby

## Book Titles
#
# Book Titles in English obey some strange capitalization rules. For example, "and" is lowercase in "War and Peace".

class Book
  attr_reader :title

  @@conjunctions = %w{and but or nor for so yet}
  @@articles = %w{a an the}
  @@prepositions = %w{about above across against along among around at before behind below beneath beside between beyond by down during except for from in inside into like near of off on since to toward through under until up upon with within}

  def title=(value)
    @title = title_case(value.to_s)
  end

  private

  def title_case(value)
    value
  end

  def something
    "I am private too"
  end
end


describe Book do

  before do
    @book = Book.new
  end

  describe 'title' do
    it 'should capitalize the first letter' do
      @book.title = "inferno"
      expect(@book.title).to eq "Inferno"
    end

    it 'should capitalize every word' do
      @book.title = "stuart little"
      expect(@book.title).to eq "Stuart Little"
    end

    describe 'should capitalize every word except...' do
      describe 'articles' do
        specify 'the' do
          @book.title = "alexander the great"
          expect(@book.title).to eq "Alexander the Great"
        end

        specify 'a' do
          @book.title = "to kill a mockingbird"
          expect(@book.title).to eq "To Kill a Mockingbird"
        end

        specify 'an' do
          @book.title = "to eat an apple a day"
          expect(@book.title).to eq "To Eat an Apple a Day"
        end
      end

      specify 'conjunctions' do
        @book.title = "war and peace"
        expect(@book.title).to eq "War and Peace"
      end

      specify 'prepositions' do
        @book.title = "love in the time of cholera"
        expect(@book.title).to eq "Love in the Time of Cholera"
      end
    end

    describe 'should always capitalize...' do
      specify 'I' do
        @book.title = "what i wish i knew when i was 20"
        expect(@book.title).to eq "What I Wish I Knew When I Was 20"
      end

      specify 'the first word' do
        @book.title = "the man in the iron mask"
        expect(@book.title).to eq "The Man in the Iron Mask"
      end
    end
  end
end
