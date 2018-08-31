# class Vehicle
#     attr_accessor :make, :model

#     def initialize

#     end
# end

# civic = Vehicle.new
# civic.make = "Honda"
# civic.model = "Civic"

# puts civic.make
# puts civic.model

class Vehicle    

    def initialize(make, model)
        @make = make
        @model = model
        @fuel = 0
    end

    def refuel(litres)
        if litres + @fuel > @fuel_capacity
            @fuel = @fuel_capacity
        else
            @fuel += litres
        end
        puts "You have #{@fuel} litres of fuel in the tank."
    end

end

class Car < Vehicle
    def wind_up_windows
        puts "You wind up the wndows in #{model}."
    end

    def refuel(litres)
        @fuel_capacity = 50
        super
    end
end

class Motorcycle < Vehicle
    def wheelie
        puts "#{model} performs a wheelie!"
    end

    def refuel(litres)
        @fuel_capacity = 15
        super
    end
end

civic = Car.new( 'Honda', 'Civic' )

low_rider = Motorcycle.new( 'Harley Davidson', 'Low Rider' )

civic.refuel(20)

civic.refuel(60)

low_rider.refuel(20)

civic.refuel(10)

