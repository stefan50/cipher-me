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
		json = params.permit(:message)
		@message = Message.new
		@message.text = json
		@message.save
		url = "https://cipher-me.herokuapp.com/messages/" + @message.id.to_s
		url_json = {:url => url}  	
		render json: url_json.to_json
	end
end
