class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match (/items/)
            requested_item_name = req.path.split("/items/").last
            requested_item = Item.all_items.find{|item| item.name == requested_item_name}
            if requested_item != nil
                resp.write requested_item.price
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