# frozen-string-literal: true

class PagesController < ApplicationController
  before_action :require_user

  def index
    @last_feed = Feeding.first
    @last_pee = Changing.with_pee.first
    @last_poop = Changing.with_poop.first
    @last_pump = Pumping.first
  end
end
