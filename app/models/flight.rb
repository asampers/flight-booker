class Flight < ApplicationRecord
  validates :departure_time, presence: true
  validates :departure_date, presence: true
  validates :origin_id, presence: true
  validates :destination_id, presence: true
  
  belongs_to :origin_airport, class_name: "Airport",
                              foreign_key: :origin_id,
                              inverse_of: :departing_flights
  belongs_to :destination_airport, class_name: "Airport",
                              foreign_key: :destination_id,
                              inverse_of: :arriving_flights   

  has_many :bookings
  has_many :passengers, through: :bookings
  
  def selected_options
    "You've selected #{origin_airport.location} to #{destination_airport.location} on #{humanize_date}"
  end
  
  def details
    depart_time = humanize_departure
    arrive_time = humanize_arrival
    "#{depart_time} departure from #{origin_airport.code} and arrive at #{arrive_time} to #{destination_airport.code}"
  end

  def departure_details
    depart_time = humanize_departure
    depart_date = humanize_date
    "#{depart_time} on #{depart_date} from #{origin_airport.code} (#{origin_airport.location})"
  end

  def arrival_details
    arrive_time = humanize_arrival
    "#{arrive_time} to #{destination_airport.code} (#{destination_airport.location})"
  end

  def humanize_departure
    departure_time.strftime('%l:%M %p')
  end

  def humanize_arrival
    (departure_time + (duration.to_f / 60).hours).strftime('%l:%M %p')
  end 

  def humanize_date
    departure_date.strftime("%B %d, %Y")
  end                                                                         
end
