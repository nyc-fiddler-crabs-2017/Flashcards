Deck.create(title: 'Nighthawk Flashcards')

nighthawk_cards = [ {question: 'What is a nighthawks primary food source?', answer: 'insects', deck_id: 1},
  {question: 'True or false?  Nighthawks are closely related to hawks.', answer: 'false', deck_id: 1}, {question: 'True or false?  Nighthawks make nests.', answer: 'false', deck_id: 1}
]

Card.create!(nighthawk_cards)
Deck.create(title: 'Otter Flashcards')

otter_cards = [ {question: "What is an otter's primary food source?
", answer: 'fish', deck_id: 2},
  {question: 'True or false? Otters spend the majority of their time on land.
', answer: 'true', deck_id: 2}, {question: 'How many species of otters are there?', answer: '13', deck_id: 2}
]

Card.create!(otter_cards)
Deck.create(title: 'Slangcards')

slang_cards = [ {question: 'Brick', answer: 'Cold', deck_id: 3}, {question: 'Mad', answer: 'Many', deck_id: 3}, {question: 'One who is ugly', answer: 'Uggo', deck_id: 3}, {question: 'A person who has stopped growing at both ends and is now growing in the
middle.', answer: 'Adult', deck_id: 3}, {question: 'Trill', answer: 'true and real', deck_id: 3}, {question: 'Neglext', answer: 'The act of abandoning someone in mid-conversation for a prolonged period of time(intentionally or unintentionally) via the sending of text messages electronically especially from one cell phone to another.
', deck_id: 3}, {question: 'Catch these thumbs', answer: 'Fighting or serving/ about to serve your opponent an ass whoopin in video game.', deck_id: 3}, {question: 're-accommodate', answer: 'to beat up and violently drag paying passengers off an airplane in order to make room for airline crew on stand-by.', deck_id: 3}, {question: "When you and someone else make arrangements to hang out but the plans we're not officially made, therefore they can diminish like a cloud in the sky", answer: 'Cloud Plans', deck_id: 3}
]

Card.create!(slang_cards)
