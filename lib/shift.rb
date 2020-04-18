class Shift

  attr_reader :key, :date

  def initialize(key = "12345", date = DateTime.now.strftime('%d%m%y').to_s)
    @key = key
    @date = date
  end

  def paired_keys
    paired = []
    @key.split(//).each_cons(2) do |single|
      paired << single.join.to_i
    end
    paired
  end

  def assign_keys
    keys = {}
    keys[:A] = paired_keys[0]
    keys[:B] = paired_keys[1]
    keys[:C] = paired_keys[2]
    keys[:D] = paired_keys[3]
    keys
  end

  def squared_date
    #squared = []
    squared = (@date.to_i  * @date.to_i)
    squared.to_s
  end

  def last_four_digits
    last_four = squared_date[-4..-1].split(//)
    last_four.map(&:to_i)
    #require "pry"; binding.pry
    #last_four.split(//).to_i
  end

  def offsets
    offsets = {}
    offsets[:A] = last_four_digits[0]
    offsets[:B] = last_four_digits[1]
    offsets[:C] = last_four_digits[2]
    offsets[:D] = last_four_digits[3]
    offsets
  end
end
