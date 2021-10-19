# frozen_string_literal: true

class Oystercard
  attr_reader :balance, :entry_station

  MAX_CARD_BALANCE = 90

  MIN_CHARGE = 1 

  def initialize
    @balance = 0
    @entry_station = nil 
  end

  def top_up(amount)
    error_message = 'Maximum balance exceeded'
    raise error_message if amount + balance > MAX_CARD_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise 'not enough funds' if @balance < MIN_CHARGE
    @entry_station = station
    journey?
  end 

  def touch_out
    deduct(MIN_CHARGE)
    @entry_station = nil 
    journey?
  end 


  def journey? 

    # true if @entry_station != nil 
    # false if @entry_station == nil 

    if @entry_station == nil 
      return false  
    else 
      return true
    end 
  
  end 
  


  private 

  def deduct(amount)
    @balance -= amount
  end

 



end
