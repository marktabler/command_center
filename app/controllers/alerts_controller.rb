
class AlertsController < ApplicationController

  def create
    if params[:pw] == INTERNAL_PASSWORD
      @instruction = Instruction.find(params["alert"]["instruction_id"])
      @instruction.create_alert(params["alert"]["body"])
      return render nothing: true, status: 200
    else
      return render nothing: true, status: 403
    end
  end
end
