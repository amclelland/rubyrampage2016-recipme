module Api
  class ItemsController < ApplicationController
    def update
  		Item.find(params[:id]).update_attributes(purchased: params[:status])
  		render :json => { :success => "success", :status_code => "200" }
  	end
  end
end
