# frozen-string-literal: true

class FeedingsController < ApplicationController
  before_action :find_feeding, only: %i(show edit update destroy)

  include ApplicationHelper

  def index
    @feedings = Feeding.order(id: :desc).all
  end

  def show
  end

  def new
    @feeding = Feeding.new(left_breast: 15, right_breast: 15)
  end

  def create
    @feeding = Feeding.new(create_params)

    if @feeding.save
      redirect_to :root, notice: "#{feeding_link(@feeding)} created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @feeding.update(update_params)
      redirect_to :root, notice: "#{feeding_link(@feeding)} updated"
    else
      render :new
    end
  end

  def destroy
    @feeding.destroy
    redirect_to :root, notice: "Feeding deleted"
  end

  private

  def feeding_link(feeding)
    "<a href=\"#{url_for(@feeding)}\">#{l(@feeding.start_time, format: :short_time)} feeding</a>"
  end

  def find_feeding
    @feeding = Feeding.find(params[:id])
  end

  def create_params
    params.require(:feeding).permit(:amount, :left_breast, :right_breast, :formula, :milk, :notes).tap do |p|
      p[:start_time] = extract_time_param(:feeding)
    end
  end

  def update_params
    create_params
  end
end
