class Oystercard
  attr_reader :balance

  MAX_CARD_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    error_message = 'Maximum balance exceeded'
    raise error_message if amount + balance > MAX_CARD_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
