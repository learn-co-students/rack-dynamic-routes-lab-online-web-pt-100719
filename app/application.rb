require 'pry'
class Application

  @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            if @@items.any? {|i| i.name == item_name}
                item = @@items.select {|item| item.name == item_name}
                # binding.pry
                resp.write item.map {|item| item.price}
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

