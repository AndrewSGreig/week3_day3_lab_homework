require('pg')
require_relative("../db/sql_runner")

class Album
  attr_accessor :album_title, :album_genre, :id, :album_artist_id
  # attr_reader :id, :artist_id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @album_title = options['album_title']
    @album_genre = options['album_genre']
    @album_artist_id = options['album_artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums
    (
      album_title, album_genre, album_artist_id
    ) VALUES
    (
      $1, $2, $3
    )
    RETURNING id;"
    values = [@album_title, @album_genre, @album_artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i

  end

  def self.all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map { |album| Album.new(album) }
  end




end
