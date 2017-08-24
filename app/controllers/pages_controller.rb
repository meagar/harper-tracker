
class PagesController < ApplicationController
  def index
    @last_feed = Feeding.order(:created_at).last
  end
end
