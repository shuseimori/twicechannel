class VideosController < ApplicationController

  require 'rubygems'
  require 'google/apis/youtube_v3'
  require 'active_support/all'


  DEVELOPER_KEY = 'AIzaSyAiOx8vKcFEwN_CaNQywbUiOEUy2kkqBgc'

def get_data
      client = Google::Apis::YoutubeV3::YouTubeService.new
      client.key = DEVELOPER_KEY

  results = client.list_playlist_items(
    :snippet,
    max_results: 50,
    playlist_id: 'PL3GvAIsGb_gAF3bToKSBbTVRzDKiQI0Jk'
  )

@videos = results.items

end

def index
    get_data
end

end
