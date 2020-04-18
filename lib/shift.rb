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

  def offsets
    squared = (@date.to_i  * @date.to_i)

  end
end