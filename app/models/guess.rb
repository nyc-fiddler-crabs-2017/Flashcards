class Guess < ApplicationRecord
  belongs_to :card
  belongs_to :round

  validates :round, :attempt, presence: true
end
