class WelcomeController < ApplicationController
  def index

  end
  def vitals
    @client = Strava::Api::V3::Client.new(:access_token => "383f7eca09e0450adb1aa47f123dec77370eac6a")
    @elevation = @client.list_athlete_activities.first["total_elevation_gain"]
    @unrounded_distance = (@client.list_athlete_activities.first["distance"]) / 1000
    @distance = @unrounded_distance.round(0)
    @heartrate = @client.list_athlete_activities.first["average_heartrate"]
    if @heartrate.nil? == true
        @average_heartrate = 0
    else
        @average_heartrate = @heartrate
    end
    @average_watts = @client.list_athlete_activities.first["average_watts"]
    @average_speed = @client.list_athlete_activities.first["average_speed"].round(0) * 3.6
    @summary_polyline = @client.list_athlete_activities.first["map"]["summary_polyline"]
    gon.polyline = @summary_polyline
  end

  def craft
    
  end

end
