# frozen-string-literal: true

class ChangingsController < ApplicationController
  before_action :find_changing, only: %i(show edit update destroy)

  def index
    @changings = Changing.order(change_time: :desc)
  end

  def show
  end

  def new
    @changing = Changing.new
  end

  def create
    @changing = Changing.new(create_params)

    if @changing.save
      redirect_to :root, notice: "#{changing_link} created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @changing.update(update_params)
      redirect_to :root, notice: "#{changing_link} updated"
    else
      render :edit
    end
  end

  def destroy
    @changing.destroy!
    redirect_to :changings, notice: 'Changing deleted'
  end

  private

  def changing_link
    "<a href=\"#{url_for(@changing)}\">#{l(@changing.change_time, format: :short_time)} diaper change</a>"
  end

  def find_changing
    @changing = Changing.find(params[:id])
  end

  def create_params
    params.require(:changing).permit(:poop, :pee, :notes).tap do |p|
      p[:change_time] = extract_time_param(:changing)
    end
  end

  def update_params
    create_params
  end
end
