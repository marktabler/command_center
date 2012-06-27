class InstructionsController < ApplicationController

	def index

	end

	def create
		Instruction.create(params[:instruction])
	end
	
end
