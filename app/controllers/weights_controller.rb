# frozen-string-literal: true

class WeightsController < ApplicationController
  def index
    @weigh_ins = WeighIn.order(weigh_time: :desc).all
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

  private

  def create_params
    binding.pry
    params.require(:weigh_in).permit(:weigh_time, :weight, :notes)
  end
end
