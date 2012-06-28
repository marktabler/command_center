class InstructionsController < ApplicationController
  before_filter :login_required

	def index
    @instructions = current_user.instructions
	end

	def create
		Instruction.create(params[:instruction])
	end

  def new
    
  end
	
end
