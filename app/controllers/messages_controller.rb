require 'json'

class MessagesController < ApplicationController
	protect_from_forgery except: :api
	def new
	end
	def create
		@message = Message.new(params.require(:messages).permit(:text))
		@message.save		
	end
	def show
		@message = Message.find(params[:id])
	end
	def api
		json_data = params.require(:messages).permit(:message)
		@obj = JSON.parse(json_data)
		render json: @obj
	end
end
