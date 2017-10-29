class MessagesController < ApplicationController
	def new
	end
	def create
		@message = Message.new(params.require(:messages).permit(:text))
		@message.save
		
	end
	def show
		@message = Message.find(params[:id])
	end
end
