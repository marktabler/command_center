class InstructionsController < ApplicationController
  before_filter :login_required

	def index
    @instructions = current_user.instructions
	end

	def create
		current_user.instructions.create(params[:instruction])
	end

  def new

  end
	
  def update
    @instruction = current_user.instructions.find(params[:id])
    @instruction.update_attributes(params[:instruction])
    return redirect_to action: :index
  end

end
