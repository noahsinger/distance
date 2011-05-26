class DistanceController < ApplicationController
  def index
    
  end
  
  def calc
    unless params[:lat1].blank? or params[:lng1].blank? or params[:lat2].blank? or params[:lng2].blank?
      a = GeoKit::LatLng.normalize params[:lat1], params[:lng1]
      b = GeoKit::LatLng.normalize params[:lat2], params[:lng2]
      redirect_to distance_index_url(:result => a.distance_to( b ))
    else
      redirect_to distance_index_url, :notice => "The lat's and lng's are required"
    end
  end
end
