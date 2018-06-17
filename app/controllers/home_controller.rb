class HomeController < ApplicationController
  
  def index
    # adding moduels
    require 'net/http'
    require 'json'
    # instance variable thats adding url
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    # @url = 'https://api.coinmarketcap.com/v2/ticker/'
    # create uri (uniform resource identifer)
    @uri = URI(@url)
    # go to the website url
    @response = Net::HTTP.get(@uri)
    # grab result and parse it to the json and give the results to coins
    @coins = JSON.parse(@response)
    # list of currency we want to pull out
    @my_coins = ["BTC", "XRP", "ADA", "XLM", "STEEM"]
  end

  def about
  end

  def lookup
    @cryptos = Crypto.all
    # adding moduels
    require 'net/http'
    require 'json'
    require 'date'
    # instance variable thats adding url
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    # @url = 'https://api.coinmarketcap.com/v2/ticker/'
    # create uri (uniform resource identifer)
    @uri = URI(@url)
    # go to the website url
    @response = Net::HTTP.get(@uri)
    # grab result and parse it to the json and give the results to coins
    @lookup_coin = JSON.parse(@response)
    

    @symbol = params[:sym]

    if @symbol
      # turn symbol into upper case
      @symbol = @symbol.upcase
    end

    # Error message if no currency is entered
    if @symbol == ""
      flash.now[:alert] = "You forgot to enter a currency symbol, try again"
    end


  end

end
