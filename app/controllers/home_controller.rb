class HomeController < ApplicationController
  # before anything else happens, common:content method, accessable only for index and team
  before_action :common_content, :only => [:index, :team] 
  
 def common_content
     # Variables with fake generator items
   @hero_name = Faker::Superhero.name
   @hero_power = Faker::Superhero.power
   @hero_prefix = Faker::Superhero.prefix
   @hero_suffix = Faker::Superhero.suffix 
   @hero_descriptor = Faker::Superhero.descriptor
   @hero_corp_title = Faker::Name.title 
   @hero_corp_power = Faker::Company.bs
   @hero_corp_power = @hero_corp_power.titleize
   
   # Variables for randomnize avatars, avtar-backgrounds.
   @rand_num = rand(1..1000)
   @set_number = rand(1..4) 
   @bg = rand(1..2)
   
   # if statment for randominze avatar picture
   if @set_number == 1
     @set = "set1"
    elsif @set_number == 2
      @set = "set2"
    elsif @set_number == 3
      @set = "set3"
    else 
      @set = "set4"
   end
   
   # if statement for randominze background i avatar picture
   if @bg == 1
     @background = "bg1"
    else
      @background = "bg2"
   end
   # Varaible with url from robothash.org, for customizing url 
   @avatar = Faker::Avatar.image(@rand_num, "300x300", "png", @set, @background)
   
 end
 
  def index
  end
  
  # Controller for team page
  def team #Method team
    @team_number = params[:team_number].to_i
  end
end
