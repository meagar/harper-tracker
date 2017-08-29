# frozen-string-literal: true

class Changing < ApplicationRecord
  validates :change_time, presence: true
  validates :poop, presence: true
  validates :pee, presence: true

  default_scope -> { order(change_time: :desc) }

  scope :last_24, -> { where('change_time >= ?', 24.hours.ago) }

  scope :with_pee, -> { where('pee > 0') }
  scope :with_poop, -> { where('poop > 0') }

  enum poop: %i(no_poop light_poop medium_poop heavy_poop)
  enum pee: %i(no_pee light_pee medium_pee heavy_pee)
end
