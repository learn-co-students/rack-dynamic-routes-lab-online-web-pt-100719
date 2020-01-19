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
#       @@items.each do |item|
#         resp.write "#{item}\n"
#       end
#     elsif req.path.match(/search/)
#       search_term = req.params["q"]
#       resp.write handle_search(search_term)
#     elsif req.path.match(/cart/)
#       if @@cart.size == 0
#         resp.write "Your cart is empty"
#       else
#         @@cart.each do |item|
#         resp.write "#{item}\n"
#       end
#     end
#     elsif req.path.match(/add/)
#       added_item = req.params["item"]
#       resp.write add_item(added_item) 
#     else
#       resp.write "Path Not Found"
#     end
#     resp.finish

#   def handle_search(search_term)
#     if @@items.include?(search_term)
#       return "#{search_term} is one of our items"
#     else
#       return "Couldn't find #{search_term}"
#     end
#   end
