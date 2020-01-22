class Application

  @@items = []

  def call(env)

    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match('/items/')

      item_name = req.path.split("/items/").last
      item = @@items.find do |i|
        i.name == item_name
      end

      if item                       # If the item in the @@items array is found
        resp.write item.price       # Respond by writing the item's price
      else                          # Else, if the item is NOT found
        resp.write "Item not found" # Respond by writing 'Item not found'
        resp.status = 400           # Tells the client there is an error code of 400
      end

    else                            # Else, if the path is not found
      resp.write "Route not found"  # Respond by writing 'Route not found'
      resp.status = 404             # Tells the client there is an error code of 404
    end

    resp.finish
  end

end
