module ApplicationHelper
  BIRTH_TIME = DateTime.parse('August 16 5:41:00 EST')

  def nav_items
    {
      feedings: 'Feedings',
      changings: 'Diaper Changes',
      weigh_ins: 'Weigh-Ins',
      pumpings: 'Pumpings',
      reports: 'Reports'
    }
  end

  def current_age
    diff = (DateTime.now - BIRTH_TIME)
    "#{diff.to_i} days old"
  end

  def hours_minutes_ago(time)
    diff = (Time.now - time)

    h = (diff / 3600).floor
    m = ((diff - (h * 3600)) / 60).floor

    if h > 0
      if m > 0
        "#{h}h #{m}m"
      else
        "#{h}h"
      end
    else
      "#{m}m"
    end
  end

  def lbs(g)
    lbs = g * 0.00220462
    oz = ((lbs - lbs.floor) * 16).round

    if oz == 16
      lbs += 1
      oz = 0
    end

    "#{lbs.floor}, #{oz}"
  end
end
