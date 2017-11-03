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
		file = params[:file]
		json = File.read(file.path)
		@obj = JSON.parse(json)
		redirect_to action: "create", id: @obj[:id]
	end
end
