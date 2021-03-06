class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        if self.user.height < self.attraction.min_height && self.user.tickets < self.attraction.tickets
            "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
        elsif self.attraction.tickets > self.user.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."    
        elsif self.user.height < self.attraction.min_height 
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif
            self.user.tickets = self.user.tickets - self.attraction.tickets
            
            self.user.nausea = self.user.nausea + self.attraction.nausea_rating

            self.user.happiness = self.user.happiness + self.attraction.happiness_rating
            self.user.save
            "Thanks for riding the #{self.attraction.name}!"
        end
    end
end
