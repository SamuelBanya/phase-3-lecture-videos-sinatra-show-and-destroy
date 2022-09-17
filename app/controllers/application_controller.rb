class ApplicationController < Sinatra::Base
    set :default_content_type, "application/json"

    get "/customer_pets" do 
        customer_pet = CustomerPet.all()
        customer_pet.to_json()
    end

    # NOTE: This was commented out since it wasn't as dynamic as we needed it to be:
    # get "/customer_pets/2" do 
        # "Hello World!"
    # end
    get "/customer_pets/:id" do 
        # binding.pry()
        customer_pet = CustomerPet.find(params[:id])
        customer_pet.to_json()
    end

    delete "/customer_pets/:id" do 
        customer_pet = CustomerPet.find(params[:id])
        # NOTE: This is the Ruby Docs page on the .destroy() method:
        # https://apidock.com/rails/ActiveRecord/Relation/destroy
        customer_pet.destroy()
        customer_pet.to_json()
    end
end