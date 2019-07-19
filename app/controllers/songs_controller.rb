class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end

    get '/songs/new' do 
        @songs = Song.all
        @genres = Genre.all
        erb :'songs/new'
    end

    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        # binding.pry
        erb :'songs/show'
    end

    get '/songs/:slug/edit' do
        erb :'songs/edit'
    end

    post '/songs' do
        song = Song.create(name: params[:song][:name])

        if params[:song][:genre]
            # genres = []
            params[:song][:genre].each do |a|
                # binding.prysong
                unless a.empty?
                    g = Genre.find(a)
                    song.genres << g
                end
            end
        end
        artist = Artist.create(name: params[:artist][:name])
        song.artist = artist
        song.save
        # binding.pry

        redirect "/songs/#{song.slug}"
        # redirect "/songs/#{song.name}"

    end

end
