class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    # has_many :movies, through: :characters

    def slug
        name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(s_find)
        Genre.all.find{|genre| genre.slug == s_find}
    end



end