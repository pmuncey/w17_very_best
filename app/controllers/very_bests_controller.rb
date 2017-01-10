class VeryBestsController < ApplicationController
  before_action :current_user_must_be_very_best_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_very_best_user
    very_best = VeryBest.find(params[:id])

    unless current_user == very_best.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = VeryBest.ransack(params[:q])
    @very_bests = @q.result(:distinct => true).includes(:food, :venue, :user).page(params[:page]).per(10)

    render("very_bests/index.html.erb")
  end

  def show
    @very_best = VeryBest.find(params[:id])

    render("very_bests/show.html.erb")
  end

  def new
    @very_best = VeryBest.new

    render("very_bests/new.html.erb")
  end

  def create
    @very_best = VeryBest.new

    @very_best.food_id = params[:food_id]
    @very_best.venue_id = params[:venue_id]
    @very_best.user_id = params[:user_id]

    save_status = @very_best.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/very_bests/new", "/create_very_best"
        redirect_to("/very_bests")
      else
        redirect_back(:fallback_location => "/", :notice => "Very best created successfully.")
      end
    else
      render("very_bests/new.html.erb")
    end
  end

  def edit
    @very_best = VeryBest.find(params[:id])

    render("very_bests/edit.html.erb")
  end

  def update
    @very_best = VeryBest.find(params[:id])

    @very_best.food_id = params[:food_id]
    @very_best.venue_id = params[:venue_id]
    @very_best.user_id = params[:user_id]

    save_status = @very_best.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/very_bests/#{@very_best.id}/edit", "/update_very_best"
        redirect_to("/very_bests/#{@very_best.id}", :notice => "Very best updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Very best updated successfully.")
      end
    else
      render("very_bests/edit.html.erb")
    end
  end

  def destroy
    @very_best = VeryBest.find(params[:id])

    @very_best.destroy

    if URI(request.referer).path == "/very_bests/#{@very_best.id}"
      redirect_to("/", :notice => "Very best deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Very best deleted.")
    end
  end
end
