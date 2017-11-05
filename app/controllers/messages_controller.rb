require 'json'

class MessagesController < ApplicationController
	protect_from_forgery except: :api
	def new
	end
	def create
		@message = Message.new(params.require(:messages).permit(:text))
		@message.save
		url = "https://cipher-me.herokuapp.com/messages/" + @message.id.to_s
		render plain: url		
	end
	def show
		@message = Message.find(params[:id])
		@message.destroy
	end
	def api
		json_data = params.permit(:message)
		json_data = JSON.parse(json_data)
		@message = Message.new(json_data[:message])
		@message.save
		@url = "https://cipher-me.herokuapp.com/messages/" + @message.id.to_s
		@url = JSON.stringify("url": @url)
		render json: @url
	end
end
