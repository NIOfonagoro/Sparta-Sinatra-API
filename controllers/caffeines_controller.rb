require 'httparty'

class CaffeineController < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Turn on Sinatra Reloader
  configure :development do
    register Sinatra::Reloader
  end

  # $caffeines = [
  #   {
  #     :id => 0,
  #     :name => 'Cappucino',
  #     :city => 'Wakanda',
  #     :perks => 'Vibranium suit',
  #     :rarity => 'Very Rare',
  #     :timeframe => 'All Day'
  #   },
  #   {
  #     :id => 1,
  #     :name => 'Mocha',
  #     :city => 'Washington DC',
  #     :perks => 'Super soldier',
  #     :rarity => 'Common',
  #     :timeframe => 'Evening'
  #   },
  #   {
  #     :id => 2,
  #     :name => 'Espresso',
  #     :city => 'New York',
  #     :perks => 'Agility, Strength',
  #     :rarity => 'Medium',
  #     :timeframe => 'Morning'
  #   }
  # ]

  # Index
  get "/caffeines" do

    # @caffeines = $caffeines
    @caffeines = HTTParty.get('https://serene-reef-18451.herokuapp.com/api/v1/caffeines')
    # puts response
    erb :"caffeines/index"

  end

  # New
  get "/caffeines/new" do

    @caffeine = {
      :id => '',
      :name => '',
      :city => '',
      :perks => '',
      :rarity => '',
      :timeframe => ''
    }

    erb :"caffeines/new"
  end

  # Show
  get "/caffeines/:id" do

    id = params[:id].to_i

    response = HTTParty.get('https://serene-reef-18451.herokuapp.com/api/v1/caffeines')['data']

    response.each do |data|
      if data['id'] == id
        @caffeine = data
      end
    end

    erb :"caffeines/show"
  end

  # Create
  post "/caffeines/" do
    new_caffeine = {
      :id => $caffeine.last[:id] + 1,
      :name => params[:name],
      :city => params[:city],
      :perks => params[:perks],
      :rarity => params[:rarity],
      :timeframe => params[:timeframe]
    }

    $heroes.push new_hero

    redirect '/heroes'
  end

  # Edit
  get "/caffeines/:id/edit" do

    erb :"caffeines/edit"

  end
  # Update
  put "/caffeines/:id" do

  end
  # Destroy
  delete "caffeines/:id" do

  end
end
