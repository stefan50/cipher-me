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
		@message.destroy
	end
	def api
		json_data = params.permit(:message)
		# @obj = JSON.parse(json_data)
		render json: json_data
	end
end
