module ApplicationHelper
  def convet_time_to_m_d(time)
    if time.blank?
      return
    else
      time.strftime("%m-%d")
    end
  end
end
