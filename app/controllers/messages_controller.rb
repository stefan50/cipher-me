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
		respond_to do |format|
			format.json {json = params.permit(:message)}
			format.xml {json = Nokogiri::XML.fragments(request.body.read).content}
		end
		json = Hash.from_xml(json).to_json
		@message = Message.new
		@message.text = json
		@message.save
		url = "https://cipher-me.herokuapp.com/messages/" + @message.id.to_s
		url_json = {:url => url}  
		respond_to do |format|		
			format.json {render json: url_json.to_json}
			format.xml {render xml: url_json.to_xml}
		end
	end
end
