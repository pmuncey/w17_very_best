class FoodsController < ApplicationController
  def index
    @foods = Food.all

    render("foods/index.html.erb")
  end

  def show
    @food = Food.find(params[:id])

    render("foods/show.html.erb")
  end

  def new
    @food = Food.new

    render("foods/new.html.erb")
  end

  def create
    @food = Food.new

    @food.name = params[:name]
    @food.cuisine_id = params[:cuisine_id]

    save_status = @food.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/foods/new", "/create_food"
        redirect_to("/foods")
      else
        redirect_back(:fallback_location => "/", :notice => "Food created successfully.")
      end
    else
      render("foods/new.html.erb")
    end
  end

  def edit
    @food = Food.find(params[:id])

    render("foods/edit.html.erb")
  end

  def update
    @food = Food.find(params[:id])

    @food.name = params[:name]
    @food.cuisine_id = params[:cuisine_id]

    save_status = @food.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/foods/#{@food.id}/edit", "/update_food"
        redirect_to("/foods/#{@food.id}", :notice => "Food updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Food updated successfully.")
      end
    else
      render("foods/edit.html.erb")
    end
  end

  def destroy
    @food = Food.find(params[:id])

    @food.destroy

    if URI(request.referer).path == "/foods/#{@food.id}"
      redirect_to("/", :notice => "Food deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Food deleted.")
    end
  end
end
