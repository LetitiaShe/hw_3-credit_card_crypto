module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    checksum = nums_a.pop
    temp = nums_a.reverse

    temp.map!.with_index do |x, i|
      if i.even?
        if x * 2 > 9
          x = x * 2 - 9
        else
          x *= 2
        end
      else
        x = x
      end
    end

    sum = temp.inject(0, :+)
    x = sum * 9 % 10

    x == checksum
  end
end
