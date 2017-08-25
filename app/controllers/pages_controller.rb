
class PagesController < ApplicationController
  def index
    @last_feed = Feeding.order(:start_time).last
    @last_pee = Changing.with_pee.order(:change_time).last
    @last_poop = Changing.with_poop.order(:change_time).last
  end
end
