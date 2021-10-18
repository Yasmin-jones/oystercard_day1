
class Oystercard

    attr_reader :balance

    AMOUNT_CAPACITY = 90

    def initialize
        @balance = 0 
    end 

    def top_up(amount)
        
        message_error = 'Maximum balance exceeded'
        raise message_error if  amount + balance > AMOUNT_CAPACITY
        @balance += amount
    end 

end 