class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :current_user
	
	private
		def record_not_found
			render status: 404, file: "#{Rails.root}/public/404"
		end

		def current_user_session
    	return @current_user_session if defined?(@current_user_session)
    	@current_user_session = UserSession.find
 		end
  
  	def current_user
    	return @current_user if defined?(@current_user)
    	@current_user = current_user_session && current_user_session.record
  	end
end

  
