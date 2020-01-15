class Item
  attr_accessor :name, :price
  @@all_items = []

  def initialize(name,price)
    @name = name
    @price = price
    @@all_items << self
  end

  def self.all_items
    @@all_items
  end

end
