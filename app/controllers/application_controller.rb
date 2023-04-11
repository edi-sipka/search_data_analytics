class ApplicationController < ActionController::Base

    def logged_user
      @logged_user = User.find_or_create_by(ip_address: request.remote_ip)
    end
  end
  