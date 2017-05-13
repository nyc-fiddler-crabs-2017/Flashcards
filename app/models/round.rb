class Round < ApplicationRecord
belongs_to :deck
belongs_to :user
has_many :guesses


  def card_filter(round, array)
    new_array = []
    array.each do |card|
      card.guesses.each do |guess|
        unless card.answer == guess.attempt && round.id == guess.round_id
          new_array << card
        end
      end
    end
    new_array
  end

end
