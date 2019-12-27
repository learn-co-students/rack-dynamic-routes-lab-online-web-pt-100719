class Application

    @@items = []

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
      if req.path.match(/items/)
        item_name = req.path.split("/items/").last
        if @@items.any? {|item| item.name == item_name}
          items = @@items.select {|item| item.name == item_name}
          resp.write items.map { |item| item.price  }
          resp.status = 200
        else
          resp.write "Item not found"
          resp.status = 400
        end
      else
        resp.write "Route not found"
        resp.status = 404
      end
      resp.finish
    end
end