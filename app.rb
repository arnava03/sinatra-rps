require "sinatra"
require "sinatra/reloader"
require 'http'


moves = ["rock", "paper", "scissors"]

get("/") do
  wikipedia_url = "https://en.wikipedia.org/wiki/Rock_paper_scissors"
  response = HTTP.get(wikipedia_url)
  @html_content = response.body
  
  erb(:rules, { :layout => :layout })
end

get("/rock") do
  @move = moves.sample
  if @move == "rock"
    @outcome = "tied"
  elsif @move == "scissors"
    @outcome = "won"
  else
    @outcome = "lost"
  end

  erb(:rock, { :layout => :layout })
end

get("/paper") do
  @move = moves.sample
  if @move == "paper"
    @outcome = "tied"
  elsif @move == "rock"
    @outcome = "won"
  else
    @outcome = "lost"
  end

  erb(:paper, { :layout => :layout })
end

get("/scissors") do
  @move = moves.sample
  if @move == "scissors"
    @outcome = "tied"
  elsif @move == "paper"
    @outcome = "won"
  else
    @outcome = "lost"
  end

  erb(:scissors, { :layout => :layout })
end
