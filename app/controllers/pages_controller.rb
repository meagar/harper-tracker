
class PagesController < ApplicationController
  def index
    @last_feed = Feeding.first
    @last_pee = Changing.with_pee.first
    @last_poop = Changing.with_poop.first
    @last_pump = Pumping.first
  end
end
