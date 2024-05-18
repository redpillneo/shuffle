// class for card
export class Card {
  constructor(card_ID, card_name, value, suite){
    this.card_ID = card_ID;
    this.card_name = card_name;
    this.value = value;
    this.suite = suite;
  }
  createCardElement() {
    const cardDiv = document.createElement('div');
    cardDiv.className = 'card';
    cardDiv.textContent = `${this.card_name} of ${this.suite}`;
    cardDiv.dataset.cardId = this.card_ID;
    cardDiv.dataset.suite = this.suite;
    return cardDiv;
  }
}

export function createDeck() {
    const suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades'];
    const ranks = [
        { name: 'Ace', value: 1 },
        { name: '2', value: 2 },
        { name: '3', value: 3 },
        { name: '4', value: 4 },
        { name: '5', value: 5 },
        { name: '6', value: 6 },
        { name: '7', value: 7 },
        { name: '8', value: 8 },
        { name: '9', value: 9 },
        { name: '10', value: 10 },
        { name: 'Jack', value: 11 },
        { name: 'Queen', value: 12 },
        { name: 'King', value: 13 }
    ];

    const deck = [];
    let card_ID = 1;

    suits.forEach(suite => {
        ranks.forEach(rank => {
            const card = new Card(card_ID++, rank.name, rank.value, suite);
            deck.push(card);
        });
    });

    return deck;
}

export function pickRandomCard(arr) {
  const randomIndex = Math.floor(Math.random() * arr.length);
  return arr[randomIndex];
}

export function isCardInDeck(card, deck) {
    return deck.some(deckCard => 
        deckCard.card_ID === card.card_ID && 
        deckCard.card_name === card.card_name && 
        deckCard.value === card.value && 
        deckCard.suite === card.suite
    );
}