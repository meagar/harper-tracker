
class PagesController < ApplicationController
  def index
    @last_feed = Feeding.order(:created_at).last
    @last_pee = Changing.with_pee.order(:created_at).last
    @last_poop = Changing.with_poop.order(:created_at).last
  end
end
