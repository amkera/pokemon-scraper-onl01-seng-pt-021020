class Pokemon
  
  attr_reader :id, :name, :type, :db
  
  #We want these to be attr_readers only, because we don't want to overwrite what's coming from the scraper class and database. 
  
  @@all = []
  
  def initialize(id:, name:, type:, db:)
    @id = id
    #Why isn't id=nil here? 
    @name = name 
    @type = type  
    @db = db
    @@all << self 
  end 
  
  def self.save(name, type, db_connection)
    db_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 
  
  def self.find(id, db_connection) #why do we need db_connection here?
    pokemon_instance = db_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    #need to flatten because what's returned is an array of arrays
    id = pokemon_instance[0]
    name = pokemon_instance[1]
    type = pokemon_instance[2]
    
    #must return an object. Instantiate a pokemon here with the proper attributes.
    
    pokemon = Pokemon.new(
      id: id, 
      name: name, 
      type: type, 
      db: db_connection)
  end 
    
  
  
    
end
