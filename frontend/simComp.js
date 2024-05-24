
const sessionCards = JSON.parse(localStorage.getItem('sessionCards'));
// console.log(sessionCards[0][0])
let deck_no = sessionCards.length
let card_no = sessionCards[0].length
const totalCardNums = deck_no * card_no
let intervalId
let cardIndex = 0
let deckIndex = 0
let correctCardCounts = 0
let sessCardIndex = 0

// timer

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

function generateDeck(sessCard) {
  var counter = 1
  for (let i = 1; i <= deck_no; i++) {
    for(let j = 1; j <= card_no; j++, counter++){
      createCard(sessCard[i-1][j-1], counter)
      // createCard(sessCard[j - 1][i - 1], i);
    }
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
  generateDeck(sessionCards)
}

function cover(){
  const cover = document.getElementById('cardCover')
  cover.style.display = 'block'
}

function nextCard() {
  if(cardIndex == card_no){
    cardIndex = 0
    deckIndex++
  }if (sessCardIndex < totalCardNums && deckIndex <= deck_no){
    cardIndex++;
    sessCardIndex++
    displayCard(sessCardIndex);
    document.getElementById('cardNoVal').innerHTML = `${cardIndex}/${card_no}`;
    document.getElementById('deckNoVal').innerHTML = `${deckIndex+1}/${deck_no}`;
  }
}


// evetListeners
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
function checkCard(deck, card){
  const guessCard = document.getElementById('cardSelect')
  console.log(guessCard) 
}


document.getElementById('cardSelect').addEventListener('keypress', function(event){
  if(event.key === 'Enter'){
    checkCard()
    nextCard()
  }
})

function startTimer(display) {
  let timer = 0, minutes, seconds;
  intervalId = setInterval(() => {
    minutes = parseInt(timer / 60, 10);
    seconds = parseInt(timer % 60, 10);

    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;

    display.textContent = minutes + ":" + seconds;

    timer++;
  }, 1000);
}

window.onload = () => {
  populateCardOptions()
  const display = document.getElementById('timer');
  startTimer(display);
};

generateSessionCards(deck_no)