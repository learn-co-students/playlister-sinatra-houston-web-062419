class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
    

    # has_many :movies, through: :characters


    def slug
        name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(s_find)
        Artist.all.find{|artist| artist.slug == s_find}
    end
end