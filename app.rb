# app.rb
require 'thin'
require 'sinatra/base'
require 'em-websocket'
require 'pry'

EventMachine.run do
  class App < Sinatra::Base
    get '/' do
      erb :index
    end
  end

  # our WebSockets server logic will go here
  @clients = []

  EM::WebSocket.start(:host => '0.0.0.0', :port => '3001') do |ws|
    ws.onopen do |handshake|
      @clients << ws
      ws.send "Connected to #{handshake.path}."
    end

    ws.onclose do
      ws.send "Closed."
      @clients.delete ws
    end

    ws.onmessage do |msg|
      @clients.each do |socket|
        msg = begin
                eval(msg).to_s
              rescue => e
                e.message
              end
        socket.send msg
      end
    end
  end

  App.run! :port => 3000
end
