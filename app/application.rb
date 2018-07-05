class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    #req = Rack::Request.new(env)

    elsif req.path.match(/search/)
      search_term = req.params["q"]

      resp.write handle_search(search_term)

    elsif req.path.match(/cart/)
      if @@cart.include?(search_term)
        resp.write @@cart.each {|c| "#{c}\n"}
      else
        resp.write "Your cart is empty."
      end

    elsif req.path.match(/add/)
      add_item = req.params[item]

      if @@items.include?(add_item)
        resp.write @@items.each {|item|"#{item}\n"}
      else
        resp.write "We do not have that item."
      end
    else
      resp.write "Path Not Found"
    end
  end

    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
