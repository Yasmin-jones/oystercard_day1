
class Journey
attr_reader :entry_station, :exit_station

    PENALTY_FARE = 6 
    FARE = 1

def initialize(entry_station: nil, exit_station: nil )
    @complete = false 
    @entry_station  = entry_station
    @exit_station = exit_station 
    
end 

def finish(station)
    @complete = true 
    self 
end 


def complete?
    @complete
    
end 

def fare 
    if @complete == true 
        return FARE
    else 
        return PENALTY_FARE
    end 

end  


end 