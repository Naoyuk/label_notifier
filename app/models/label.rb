# frozen_string_literal: true

class Label < ApplicationRecord
  validates :title, presence: true
end
