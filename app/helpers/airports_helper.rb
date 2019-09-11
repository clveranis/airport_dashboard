module AirportsHelper
  
  # check for blank values then run display helpers, instead of checking for blank in every method // helps keep code DRY
  def blank_check_helper(obj, helper)
    if obj.blank?
      "N/A"
    else
      case helper
      when "temp"
        temperature_helper(obj)
      when "wind_speed"
        wind_speed_helper(obj)
      when "wind_dir"
        wind_direction_helper(obj)
      when "humidity"
        humidity_helper(obj)
      when "lat"
        latitude_helper(obj)
      when "long"
        longitude_helper(obj)
      when "local_time"
        local_time_helper(obj)
      when "time_zone"
        time_zone_passthrough_helper(obj)
      else
        "N/A"
      end
    end
  end
  
  # convert centigrade temperature to display in fahrenheit
  def temperature_helper(deg)
    "#{(deg.round * 9/5) + 32}°F"
  end
  
  # convert meters/second to display in milers per hour
  def wind_speed_helper(wind)
    "#{(wind * 2.23694).round} mph"
  end
  
  # convert wind direction angle from degrees to cardinal direction
  def wind_direction_helper(wind)
    wind_dir = wind/45
    wind_arr = %w{ N NE E SE S SW W NW }
    "#{wind_arr[(wind_dir % 8)]}"
  end
  
  # adds % sign to relative humidity display
  def humidity_helper(humidity)
    "#{humidity.round}%"
  end
  
  # add bearing to latitude
  def latitude_helper(lat)
    if lat.to_f > 0
      "#{lat}°N"
    else
      "#{lat.to_f.abs}°S"
    end
  end
  
  # add bearing to longitude
  def longitude_helper(long)
    if long.to_f > 0
      "#{long}°E"
    else
      "#{long.to_f.abs}°W"
    end
  end
  
  # display current time according to timezone
  def local_time_helper(tz)
    Time.current.in_time_zone(tz).strftime("%l:%M %p %Z")
  end
  
  # display timezone as received from API data
  def time_zone_passthrough_helper(tz)
    "#{tz}"
  end
  
  # format API timestamp for easy readability as to when the data is from
  def simple_time_helper(time, tz)
    if time.blank? || tz.blank?
      "N/A"
    else
      dt = time.to_datetime.in_time_zone(tz)
      dt.strftime("%A, %d, %b, %Y - %l:%M %p %Z")
    end
  end

end
