class CaffeineController < Sinatra::Base
  # sets root as the parent-directory of the current file
    set :root, File.join(File.dirname(__FILE__), '..')

    # sets the view directory correctly
    set :views, Proc.new { File.join(root, "views") }

    # Turn on Sinatra Reloader
    configure :development do
        register Sinatra::Reloader
    end

    # Index
    get "/caffeines" do
      "Banter"
    end

    # New
    get "/caffeines/new" do

    end

    # Show
    get "/caffeines/:id" do

    end

    # Create
    post "/caffeines" do

    end

    # Edit
    get "/caffeines/:id/edit" do

    end
    # Update
    put "/caffeines/:id" do

    end
    # Destroy
    delete "caffeienes/:id" do

    end
end
