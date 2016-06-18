class ApplicationController < ActionController::Base
  protect_from_forgery

  def restrict_access  
  	row = Alfa::Token.where(["token = ? and expires_at >= ?", params[:token], DateTime.now]).first
    if row && Alfa::Company.where("deleted = 0").exists?(row.user.company_id)
      session[:user_id] = row.user_id
      session[:company_id] = row.user.company_id
     else 
      reset_session
      head :unauthorized
    end
  end


  def json_error(e)
  	err = '{"error":'
  	err += '{"message":"' + e.message + '",'
  	err += '"backtrace":' + e.backtrace.to_json + ','
  	err += '"inspect":"' + e.inspect + '"},'
  	err += '"status":"400"}'
  	return err
  end
end
