class Station
  attr_reader :name, :distance, :access_times

  def initialize(attrs)
    @name = attrs[:station_name]
    @address = attrs[:street_address]
    @city = attrs[:city]
    @state = attrs[:state]
    @zip = attrs[:zip]
    @fuel_types = attrs[:fuel_type_code]
    @distance = attrs[:distance]
    @access_times = attrs[:access_days_time]
  end

  def full_address
    "#{address} #{city} #{state} #{zip}"
  end

  def full_fuel_types
    fuel_types.split(' ').map do |fuel_type|
      fuel_options[fuel_type]
    end.join(' ')
  end

  private
    attr_reader :address, :city, :state, :zip, :fuel_types

    def fuel_options
      {"ELEC"=>"Electric", "LPG"=>"Propane"}
    end
end
