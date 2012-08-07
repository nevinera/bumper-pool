class ApplicationController < ActionController::Base
  protect_from_forgery

  def sidebar?
    false
  end
end
