class CaffeineController < Sinatra::Base
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Turn on Sinatra Reloader
  configure :development do
    register Sinatra::Reloader
  end

  $caffeines = [
    {
      :id => 0,
      :name => 'Cappucino',
      :city => 'Wakanda',
      :perks => 'Vibranium suit',
      :rarity => 'Very Rare',
      :timeframe => 'All Day'
    },
    {
      :id => 1,
      :name => 'Mocha',
      :city => 'Washington DC',
      :perks => 'Super soldier',
      :rarity => 'Common',
      :timeframe => 'Evening'
    },
    {
      :id => 2,
      :name => 'Espresso',
      :city => 'New York',
      :perks => 'Agility, Strength',
      :rarity => 'Medium',
      :timeframe => 'Morning'
    }
  ]

  # Index
  get "/caffeines" do

    @caffeines = $caffeines
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

    @caffeine = $caffeines[id]

    erb :"caffeines/show"
  end

  # Create
  post "/caffeines/" do
    new_caffeine = {
      :id => $heroes.last[:id] + 1,
      :name => params[:name],
      :city => params[:city],
      :abilities => params[:abilities]
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
  delete "caffeienes/:id" do

  end
end
