class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride

    user = self.user
    attraction = self.attraction

    if user.tickets < attraction.tickets && user.height < attraction.min_height
      "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
    elsif user.tickets < attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif user.height < attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      tickets = user.tickets - attraction.tickets
      nausea = user.nausea + attraction.nausea_rating
      happiness = user.happiness + attraction.happiness_rating

      user.update_columns(tickets: tickets, nausea: nausea, happiness: happiness)
      "Thanks for riding the #{attraction.name}!"
    end

  end


end
