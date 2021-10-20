# frozen_string_literal: true

class Oystercard
  attr_reader :balance, :journeys#, :exit_station

  MAX_CARD_BALANCE = 90

  MIN_CHARGE = 1 

  def initialize
    @balance = 0
    # @entry_station = nil 
    @journeys = [] 
    # @exit_station = nil 
    @journey = Hash.new 
  end

  def top_up(amount)
    error_message = 'Maximum balance exceeded'
    raise error_message if amount + balance > MAX_CARD_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise 'not enough funds' if @balance < MIN_CHARGE
    assign_entry(station)
    journey?
  end 

  def touch_out(station)
    deduct(MIN_CHARGE)
    assign_exit(station)
    store_journeys
    # @entry_station = nil 
    journey? 
  end 

  def assign_entry(station)
    @journey[:entry] = station
  end 

  def assign_exit(station)
    @journey[:exit] = station
  end 



  def journey? 
    # true if @entry_station != nil 
    # false if @entry_station == nil 
    # if @entry_station == nil 
    if @journey[:entry] == nil 
      return false  
    else 
      return true
    end 
  end 
  
  private 

  def deduct(amount)
    @balance -= amount
  end

  def store_journeys
    # journey = { 'entry' => @entry_station, 'exit' => @exit_station} 
    journeys << @journey 
    puts journeys
    journey = {}

    p journey
  end 

end

