class ImageController < ApplicationController
require 'rubygems'
require 'twitter'
require 'net/http'
require 'uri'
require 'json'

def search_keyword
  @keyword = []
    allMembers = ["Nayeon","Jeongyeon","Momo","Sana","Jihyo","Mina","Dahyun","Chaeyoung","Tzuyu"]
    @memberList = params[:twiceMember] #チェックされたメンバー

if @memberList == ["Jeongyeon","Momo"]
  @searchword = "#JeongMo #TWICE -rt"
elsif @memberList == ["Sana","Dahyun"]
  @searchword = "#SaiDa #TWICE -rt"
elsif @memberList == ["Sana","Tzuyu"]
  @searchword = "#Satzu -rt"
elsif @memberList == ["Nayeon","Jeongyeon"]
  @searchword = "#2yeon #TWICE -rt"
elsif @memberList == ["Mina","Chaeyoung"]
  @searchword = "#Michaeng -rt"
elsif @memberList == ["Mina","Tzuyu"]
  @searchword = "#MiTzu -rt"
elsif @memberList == ["Nayeon","Mina"]
  @searchword = "#MiNayeon -rt"
elsif @memberList == ["Dahyun","Chaeyoung","Tzuyu"]
  @searchword = "#SchoolMealClub -rt"

else
    allMembers.each do |person|
      if @memberList.include?(person) == true
        @keyword.push("%#{person}")
      else
        @keyword.push("-%#{person}")
      end
    end
    @searchword = @keyword.join(" ")+" -rt"+" #twice"
end
end

def twitterSearch
  client = Twitter::REST::Client.new do |config|
    config.consumer_key ="oykXKgbFCURXtKtifFZ5DLyyL"
    config.consumer_secret ="8aQtoVPrXYVP2GlYfj9kCp0nstzN1oRcS5rFMpfaJcD8geZSye"
  config.access_token ="502600217-CTTD0esMPCxc8Ex8BUc085PXZ1eIlFPosgpRpgL4"
config.access_token_secret = "egmtsLeb7gumi0uAgEZbzXxGVRGLhyNLtBpO1GD3MH5Mn"
end
@url = []
count = 0
client.search(@searchword, :filter=>"images", :result_type=>"mixed", :include_entities=>true).each do |tweet|
  tweet.media.each do |media|
    break if count >29
    @url.push(media.media_url.to_s)
    count += 1
  end
end


end

  def index
search_keyword
twitterSearch
  end

end
