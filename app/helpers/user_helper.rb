module UserHelper

  def availability(user)
    if user.status = "online" && user.last_seen < Time.now - 1.hour
      "<div id='circle'></div>".html_safe
    elsif user.status = "online" && user.last_seen > Time.now - 1.hour
      "<p>available</p>".html_safe
    else
      "<p>unavailable</p>".html_safe
    end

  end
end
