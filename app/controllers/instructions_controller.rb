class InstructionsController < ApplicationController
  before_filter :login_required, except: :runnable

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

  def runnable
    if params[:pw] == INTERNAL_PASSWORD
      @instructions = Instruction.runnable
      respond_to do |format|
        format.json {render :json => @instructions}
      end
    else
      return render nothing: true, status: 403
    end
  end

end
