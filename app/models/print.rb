class Print < ApplicationRecord
  validates :print_on, presence: true

  belongs_to :label
end
