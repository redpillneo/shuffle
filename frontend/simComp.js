
const sessionCards = JSON.parse(localStorage.getItem('sessionCards'));

// console.log(sessionCards[0][0])
let deck_no = sessionCards.length
let card_no = sessionCards[0].length



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

generateSessionCards(deck_no)