
class Oystercard

    attr_reader :balance

    AMOUNT_CAPACITY = 90

    def initialize
        @balance = 0 
    
    end 

    def top_up(amount)
        @balance += amount
        message_error = 'Error, maximum top-up amount is £90'
        raise message_error if @balance > AMOUNT_CAPACITY
       
    end 

end 