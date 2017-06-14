class PrdDeliveryLocationsController < ApplicationController

  def new
    @delivery_location = PrdDeliveryLocation.new
  end

  def create
    @delivery_location = PrdDeliveryLocation.new(delivery_location_params)
    if @delivery_location.save
      redirect_to home_path
    else
      render 'new'
    end
  end

  private

    def delivery_location_params
      params.require(:prd_delivery_location).permit(:location)
    end

end
