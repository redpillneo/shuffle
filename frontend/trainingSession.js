// importing the standard_deck
import {Card, createDeck, pickRandomCard, isCardInDeck} from './standard_deck.js';
const standard_deck = createDeck();

function getStoredData() {
  const data = sessionStorage.getItem('trainingConfig');
  return data ? JSON.parse(data) : {};
}
const data = getStoredData()
console.log(data)

const {deck_no, card_no, time_mode, shuffle_mode, recall_mode} = data

// creation of cards
const sessionCards = []

for(const i = 1; i <= deck_no; i++){
  const deck = []
  for(const j = 1; j <= card_no; j++){  
    var randomCard = null
    while(!(isCardInDeck(randomCard, deck))){
      randomCard = pickRandomCard(standard_deck)
    }
    deck.push(randomCard)
  }
  sessionCards.push(deck)
}






