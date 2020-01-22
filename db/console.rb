require('pry');
require_relative('../models/artist.rb')
require_relative('../models/album.rb')


artist1 = Artist.new({"artist_name" => "Stone Roses"})
artist1.save

artist2 = Artist.new({"artist_name" => "The Charlatans"})
artist2.save

album1 = Album.new({
  "album_title" => "Brilliant Album",
  "album_genre" => "Rock",
  "album_artist_id" => artist1.id
  })
album1.save

album2 = Album.new({"album_title"=>"Terrible Album", "album_genre"=>"Rock", "album_artist_id"=>artist2.id})
album2.save

album3 = Album.new({"album_title"=>"OK Album", "album_genre"=>"Rock", "album_artist_id"=>artist1.id})
album3.save

binding.pry
artist1.all_albums_by_artist()
nil
