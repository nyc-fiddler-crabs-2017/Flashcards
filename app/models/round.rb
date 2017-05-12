class Round < ApplicationRecord
belongs_to :deck
belongs_to :user
has_many :guesses

validates :deck, :user, presence: true

end
