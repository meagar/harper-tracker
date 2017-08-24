module ApplicationHelper
  BIRTH_TIME = DateTime.parse('August 16 5:41:00 EST')

  def current_age
    diff = (DateTime.now - BIRTH_TIME)
    "#{diff.to_i} days old"
  end
end
