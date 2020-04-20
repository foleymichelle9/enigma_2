class Enigma

  def initialize
    @shift = Shift.new
    @key = @shift.key
    @date = @shift.date
  end

  def encrypt(message, key = @key, date = @date)
    @shift = Shift.new(key, date)
    {
      encryption: @shift.shifted_message(message),
      key: key,
      date: date
    }
  end
end
