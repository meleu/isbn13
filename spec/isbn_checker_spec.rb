# frozen_string_literal: true

require 'spec_helper'
require 'isbn_checker'

describe '#initialize' do
  it 'raises InvalidIsbnError if argument has less than 12 digits' do
    # initialize accepts integers or strings
    invalid_codes = [1, 123, '123-4567-890']
    invalid_codes.each do |code|
      expect { IsbnChecker.new(code) }.to raise_error(InvalidIsbnError)
    end
  end

  it 'raises InvalidIsbnError if argument has more than 13 digits' do
    # initialize accepts integers or strings
    invalid_codes = [123_456_789_012_345, '123-4567-890-1234567890']
    invalid_codes.each do |code|
      expect { IsbnChecker.new(code) }.to raise_error(InvalidIsbnError)
    end
  end
end

describe '#check_digit' do
  it 'returns the correct check digit (4) for 978014300723' do
    isbn = IsbnChecker.new(978_014_300_723)
    expected = 4

    expect(isbn.check_digit).to eq(expected)
  end
end

describe '#valid' do
  it 'validates 9780143007234' do
    isbn = IsbnChecker.new(9_780_143_007_234)
    expect(isbn.valid?).to eq(true)
  end

  it 'validates existing ISBNs from some classic books' do
    isbn_codes = [
      '978-0141439518', # Pride and Prejudice
      '978-1250788450', # The Brothers Karamazov
      '978-0142437247' # Moby Dick
    ]

    isbn_codes.each do |code|
      isbn = IsbnChecker.new(code)
      expect(isbn.valid?).to eq(true)
    end
  end

  it 'reject invalid ISBNs' do
    invalid_codes = %w[978-0141439519 978-1250788451 978-0142437248]

    invalid_codes.each do |code|
      isbn = IsbnChecker.new(code)
      expect(isbn.valid?).to eq(false)
    end
  end
end
