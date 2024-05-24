
const sessionCards = JSON.parse(localStorage.getItem('sessionCards'));

// console.log(sessionCards[0][0])
let deck_no = sessionCards.length
let card_no = sessionCards[0].length
let cardIndex = 0
let correctCardCounts = 0


const cardContainer = document.getElementById('card-container');

function createCard(card, index) {
  const cardDiv = document.createElement('div');
  cardDiv.classList.add('card');
  cardDiv.id = `card${index}`;

  const img = document.createElement('img');
  const name = `${card.card_name}_of_${card.suite}`
  img.src = `images/cards/${name}.png`;

  cardDiv.appendChild(img);
  cardContainer.appendChild(cardDiv);
  displayCard(0);
}

function generateDeck(sessCard, dIndex) {
  for (let i = 1; i <= sessCard[dIndex].length; i++) {
    createCard(sessCard[dIndex][i - 1], i);
  }
}

function displayCard(index) {
  const cards = document.querySelectorAll('.card');
  cards.forEach((card, i) => {
    card.style.display = (i === index) ? 'block' : 'none';
  });
}

function generateSessionCards(deck_no){
  const cardDiv = document.createElement('div')
  cardDiv.classList.add('card')
  cardDiv.id = 'cardCover'
  const img = document.createElement('img')
  cardDiv.appendChild(img)
  cardContainer.appendChild(cardDiv)
  img.src = 'images/cards/cardCover.png'
  for(var i = 0; i < deck_no; i++){
    generateDeck(sessionCards, i)
  }
}

function cover(){
}

function nextCard() {
  if (cardIndex < card_no - 1) {
    cardIndex++;
    displayCard(cardIndex);
    document.getElementById('cardNoVal').innerHTML = `${cardIndex + 1}/${card_no}`;
  }
}

function checkCard(){

}

checkCard()

// evetListeners
// document.getElementById('nextCard').addEventListener('click', checkCard)
function populateCardOptions() {
  const suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades'];
  const values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'];
  const select = document.getElementById('cardSelect');

  // Loop through each suit and value to create card options
  suits.forEach(suit => {
    values.forEach(value => {
      const option = document.createElement('option');
      option.value = `${value} of ${suit}`;
      option.textContent = `${value} of ${suit}`;
      select.appendChild(option);
    });
  });
}

window.onload = populateCardOptions

generateSessionCards(deck_no)