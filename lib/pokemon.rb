class Pokemon
  
  attr_reader :id, :name, :type, :db
  @@all = []
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name 
    @type = type  
    @db = db
    @@all << self 
  end 
  
  def self.save(name, type, db_connection)
    db_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 
  
  def self.find(id, db_connection)
    pokemon_instance = db_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    id = pokemon_instance[0]
    name = pokemon_instance[1]
    type = pokemon_instance[2]
    
    #must return an object 
    
    pokemon = Pokemon.new(
      id: id, 
      name: name, 
      type: type, 
      db: db_connection)
  end 
    
  
  
    
end
