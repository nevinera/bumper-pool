class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :for_emcien_only

  def sidebar?
    false
  end

  def current_week
    Date.today.strftime("%G-%V")
  end
  helper_method :current_week

  def week_before(week)
    date = Date.strptime(week, '%G-%V')
    (date - 1.week).strftime('%G-%V')
  end
  helper_method :week_before

  def week_after(week)
    date = Date.strptime(week, '%G-%V')
    (date + 1.week).strftime('%G-%V')
  end
  helper_method :week_after


  def for_emcien_only
    raise "Emcien Only!" unless allowed_request?
  end
  def allowed_request?
    if request.local?
      true
    elsif request.remote_ip.to_s == "74.95.29.209"
      true
    else
      false
    end
  end
end
