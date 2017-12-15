class GeocoderController < ApplicationController
  def findaddress
    @address = Geocoder.address([params[:latitude], params[:longitude]])
    current_user.latitude = params[:latitude]
    current_user.longitude = params[:longitude]
    current_user.save
  end
end
