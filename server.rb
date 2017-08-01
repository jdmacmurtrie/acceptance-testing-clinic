require "sinatra"
require_relative "models/pet"
require "CSV"
require "pry"

set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  redirect "/pets"
end

get "/pets" do
  @pets = []
  CSV.foreach('pets.csv', headers: true, header_converters: :symbol) do |row|
    @pets << row
  end

  erb :index
end

post '/pets' do
  @pet_name = params[:Name]
  @pet_age = params[:Age]
  @pet_color = params[:Color]

  CSV.open("pets.csv", "a") do |file|
    file << [@pet_name, @pet_age, @pet_color]
  end

  redirect '/pets'
end

get "/pets/form" do
  erb :form
end


get "/pets/:pet" do
  @pet_name = params[:pet]
  CSV.foreach('pets.csv', headers: true, header_converters: :symbol) do |row|
    if row[:name] == params[:pet]
      @pet_age = row[:age]
      @pet_color = row[:color]
    end
  end

  erb :show
end
