
class AlertsController < ApplicationController

  def create
    if params[:pw] == INTERNAL_PASSWORD
      puts "Success on params #{params["alert"]}"
      render text: params["alert"].inspect
    else
      return render nothing: true, status: 403
    end
  end
end
