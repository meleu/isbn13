# frozen_string_literal: true

InvalidIsbnError = Class.new(StandardError)

class IsbnChecker
  def initialize(isbn)
    @isbn = sanitize(isbn.to_s)

    raise(InvalidIsbnError, 'invalid number of digits') unless (12..13).include?(@isbn.length)
  end

  ######################################################
  # Here's the logic responsible to solve the challenge:
  ######################################################
  def check_digit
    digits = @isbn.chars.first(12).map(&:to_i)

    checksum = 0
    digits.each_with_index do |digit, i|
      checksum += i.even? ? digit : digit * 3
    end

    check_mod = checksum % 10

    check_mod.zero? ? 0 : 10 - check_mod
  end
  ######################################################

  def valid?
    return false if @isbn.length != 13

    last_digit = @isbn[-1].to_i
    last_digit == check_digit
  end

  private

  def sanitize(isbn)
    isbn.scan(/\d/).join
  end
end
