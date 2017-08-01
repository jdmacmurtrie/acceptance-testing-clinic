require "sinatra"
require "CSV"
require "pry"

set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
<h2>
  redirect "/pets"
end

get "/pets" do
  @pets = []
  CSV.foreach('pets.csv', headers: true, header_converters: :symbol) do |row|
    @pets << row
  end

  erb :index
end

get "/pets/:pet" do
  @pet_name = params[:pet]
  CSV.foreach('pets.csv', headers: true, header_converters: :symbol) do |row|
    if row[:name] == @pet_name
      @pet_age = row[:age]
      @pet_color = row[:color]
    end
  end

  erb :show
end
