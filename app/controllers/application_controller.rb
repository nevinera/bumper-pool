class ApplicationController < ActionController::Base
  protect_from_forgery

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
end
