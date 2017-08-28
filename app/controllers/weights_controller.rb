# frozen-string-literal: true

class WeightsController < ApplicationController
  before_action :find_weigh_in, only: %i(show edit update destroy)

  def index
    @weigh_ins = WeighIn.order(weigh_time: :desc).all
  end

  def show
  end

  def new
    @weigh_in = WeighIn.new(weigh_time: Time.now)
  end

  def create
    @weigh_in = WeighIn.new(create_params)

    if @weigh_in.save
      redirect_to :root, notice: 'New Weight saved'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @weigh_in.update(update_params)
      redirect_to @weigh_in, notice: 'Updated'
    else
      render :edit
    end
  end

  def destroy
    @weigh_in.destroy!
    redirect_to :weigh_ins, notice: 'Weigh-in deleted'
  end

  private

  def find_weigh_in
    @weigh_in = WeighIn.find(params[:id])
  end

  def create_params
    params.require(:weigh_in).permit(:weigh_time, :weight, :notes)
  end

  def update_params
    create_params
  end
end
