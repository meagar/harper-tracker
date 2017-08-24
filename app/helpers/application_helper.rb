module ApplicationHelper
  BIRTH_TIME = DateTime.parse('August 16 5:41:00 EST')

  def current_age
    diff = (DateTime.now - BIRTH_TIME)
    "#{diff.to_i} days old"
  end

  def rounded_time(time)
    hour = time.strftime('%l').to_i
    minute = ((time.strftime('%M').to_f / 60) * 4).round * 15
    ampm = time.strftime('%P')
    "#{hour}:#{minute.to_s.rjust(2, '0')}#{ampm}"
  end
end
