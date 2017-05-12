class Guess < ApplicationRecord
  belongs_to :card
  belongs_to :round

  validates :card, :round, :attempt, presence: true
end
