require 'rubygems'
require "bundler/setup"


require 'trollop'
require 'google-api-client'


DEVELOPER_KEY = 'AIzaSyDCCzBqzCCp75gMbDO1er6Sd07v6W3HIE8'
YOUTUBE_API_SERVICE_NAME = 'youtube'
YOUTUBE_API_VERSION = 'v3'

def get_service
    client = Google::APIClient.new(
                                   :key => 'AIzaSyDCCzBqzCCp75gMbDO1er6Sd07v6W3HIE8',
                                   :authorization => nil,
                                   :application_name => "twicetube",
                                   :application_version => '1.0.0'
                                   )
                                   youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)
                                   
                                   return client, youtube
end
