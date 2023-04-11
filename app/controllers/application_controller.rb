class ApplicationController < ActionController::Base
    before_action :set_turbo_frame_request_variant
  
    private
  
    def set_turbo_frame_request_variant
      request.variant = :turbo_frame if turbo_frame_request?
    end
  
    def logged_user
      @logged_user = User.find_or_create_by(ip_address: request.remote_ip)
    end
  end
  