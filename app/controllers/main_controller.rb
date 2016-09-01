class MainController < ApplicationController
	#before_filter :authenticate_user, :only => [:index]
	def index
		@active_investments = Position.where(:active => true)
	end
end
