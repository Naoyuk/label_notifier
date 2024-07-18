# frozen_string_literal: true

class Interval < ApplicationRecord
  validates :day, presence: true
  validates :copies_per_day, presence: true

  def calc_day
     Time.zone.today + self.day
  end
end
