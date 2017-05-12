class Round < ApplicationRecord
belongs_to :deck
belongs_to :user
has_many :guesses
validates :deck, :user, presence: true


  def card_filter(round, array)
    round.deck.cards.each do |card|
      card.guesses.each do |guess|
        if card.answer == guess.attempt &&
          round.id == guess.round_id
          array.delete(card)
        end
      end
    end
    array
  end

end
