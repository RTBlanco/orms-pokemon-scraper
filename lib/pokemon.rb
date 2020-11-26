class Pokemon
  attr_accessor :name, :type, :db, :id
  
  def initialize(id:, name:, type:, db:)
    @name = name 
    @type = type
    @id = id
    @db = db
  end 

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    p = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    self.new(id: p[0], name: p[1],type: p[2],db: db)
  end
end
