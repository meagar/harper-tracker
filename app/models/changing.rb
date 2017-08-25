# frozen-string-literal: true

class Changing < ApplicationRecord
  validates :change_time, presence: true
  validates :poop, presence: true
  validates :pee, presence: true

  enum poop: %i(no_poop light_poop medium_poop heavy_poop)
  enum pee: %i(no_pee light_pee medium_pee heavy_pee)
end
