class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
    
    # has_many :movies, through: :characters

    def slug
        name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(s_find)
        Song.all.find{|song| song.slug == s_find}
    end


end