# frozen_string_literal: true

class Oystercard
  attr_reader :balance, :in_journey

  MAX_CARD_BALANCE = 90

  MIN_CHARGE = 1 

  def initialize
    @balance = 0
    @in_journey = false 
  end

  def top_up(amount)
    error_message = 'Maximum balance exceeded'
    raise error_message if amount + balance > MAX_CARD_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise 'not enough funds' if @balance < MIN_CHARGE
    @in_journey = true
  end 

  def touch_out
    @in_journey = false
  end 



end
