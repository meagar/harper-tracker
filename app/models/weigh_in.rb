class WeighIn < ApplicationRecord
  validates :weight, presence: true
  validates :weigh_time, presence: true
end
