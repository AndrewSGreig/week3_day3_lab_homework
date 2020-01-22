require('pry');
require_relative('../models/artist.rb')
require_relative('../models/album.rb')


artist1 = Artist.new(
  {
    "artist_name" => "Joe Bloggs"
  }
)
artist1.save


binding.pry
album1 = Album.new({
  "album_title" => "Brilliant Album",
  "album_genre" => "Rock",
  "album_artist_id" => artist1.id
  })


album1.save

binding.pry
nil
