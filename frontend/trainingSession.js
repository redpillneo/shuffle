// importing the standard_deck
import { Card, createDeck, pickRandomCard, isCardInDeck } from './standard_deck.js';

let deckIndex = 0;
let cardIndex = 0;
let peekCards = 0;

let intervalId;
const standard_deck = createDeck();

function getStoredData() {
  const data = sessionStorage.getItem('trainingConfig');
  return data ? JSON.parse(data) : {};
}

const data = getStoredData();

const { deck_no, card_no, time_mode, shuffle_mode, recall_mode } = data;


// creation of cards
const sessionCards = [];
console.log("number of decks: ", deck_no);
console.log("number of cards: ", card_no);

for (let i = 1; i <= deck_no; i++) {
  const deck = [];
  for (let j = 1; j <= card_no; j++) {
    let randomCard = pickRandomCard(standard_deck);
    while (isCardInDeck(randomCard, deck)) {
      randomCard = pickRandomCard(standard_deck);
    }
    deck.push(randomCard);
  }
  sessionCards.push(deck);
}

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
  const display = document.getElementById('timer');
  startTimer(display);
};

const cardContainer = document.getElementById('card-container');

function createCard(card, index) {
  const cardDiv = document.createElement('div');
  cardDiv.classList.add('card');
  cardDiv.id = `card${index}`;

  const img = document.createElement('img');
  img.src = `images/cards/${card.getURL()}.png`;

  cardDiv.appendChild(img);
  cardContainer.appendChild(cardDiv);
  displayCard(0);
}

function generateDeck(sessCard, dIndex) {
  for (let i = 1; i <= sessCard[dIndex].length; i++) {
    createCard(sessCard[dIndex][i - 1], i);
  }
}

document.getElementById('deckNoVal').innerHTML = `${deckIndex + 1}/${deck_no}`;
document.getElementById('cardNoVal').innerHTML = `${cardIndex + 1}/${card_no}`;
document.getElementById('deck-right').addEventListener('click', goToNextDeck);
document.getElementById('deck-left').addEventListener('click', backToLastDeck);
document.getElementById('shift-to-top').addEventListener('click', shiftToTop);
document.getElementById('shift-to-bottom').addEventListener('click', shiftToBottom);
document.getElementById('retract').addEventListener('click', function(){
  if (peekCards >= 0) {
    retract(peekCards);
    peekCards--;
  } 
}); 
document.getElementById('peek').addEventListener('click', function(){
  if(peekCards < 6){
    peek(peekCards)
    peekCards++
  }
});
document.addEventListener('keydown', handleKeyDown)

// remove


function goToNextDeck() {
  if (deckIndex < (sessionCards.length - 1)) {
    cardIndex = 0;
    resetContainerOffset()
    peekCards = 0;
    displayCard(cardIndex);
    cardContainer.innerHTML = '';
    deckIndex++;
    generateDeck(sessionCards, deckIndex);
    document.getElementById('deckNoVal').innerHTML = `${deckIndex + 1}/${deck_no}`;
    document.getElementById('cardNoVal').innerHTML = `${cardIndex + 1}/${card_no}`;
    displayCard(0);

  }
}
// function to iterate through each card and reset their z-index

function resetIndex(){
  const cards = document.querySelectorAll('.card')
  for(var i = 1; i <= cards.length; i++){
    const img = cards[i-1].querySelector('img')
    img.style.zIndex  = `100`
    img.style.transform = `translate(0px, 0px)`
  }
}

function resetContainerOffset(){
  const cardCont = document.getElementById('card-container')
  cardCont.style.transform = `translate(0px, 0px)`
}


function backToLastDeck() {
  if (deckIndex >= 1) {
    resetContainerOffset()
    resetIndex()
    cardIndex = 0;
    peekCards = 0;
    cardContainer.innerHTML = '';
    deckIndex--;
    generateDeck(sessionCards, deckIndex);
    document.getElementById('deckNoVal').innerHTML = `${deckIndex + 1}/${deck_no}`;
    document.getElementById('cardNoVal').innerHTML = `${cardIndex + 1}/${card_no}`;
    displayCard(0);
  }
}

function displayCard(index) {
  const cards = document.querySelectorAll('.card');
  cards.forEach((card, i) => {
    card.style.display = (i === index) ? 'block' : 'none';
  });
}

function shiftToBottom() {
  if (cardIndex < sessionCards[deckIndex].length - 1) {
    resetIndex()
    resetContainerOffset()
    peekCards = 0
    cardIndex++;
    displayCard(cardIndex);
    const card = document.getElementById(`card${cardIndex + 1}`);
    const img = card.querySelector('img');
    img.style.transform = `translate(0px, 0px)`;
    document.getElementById('cardNoVal').innerHTML = `${cardIndex + 1}/${card_no}`;
    const cardCont = document.getElementById('card-container');
    cardCont.style.transform = 'translate(0px, 0px)';
  }
}

function shiftToTop() {
  if (cardIndex > 0) {
    resetContainerOffset()
    resetIndex()
    cardIndex--;
    peekCards = 0;
    displayCard(cardIndex);
    document.getElementById('cardNoVal').innerHTML = `${cardIndex + 1}/${card_no}`;
    const card = document.getElementById(`card${cardIndex + 1}`);
    const img = card.querySelector('img');
    img.style.transform = `translate(0px, 0px)`;
    document.getElementById('cardNoVal').innerHTML = `${cardIndex + 1}/${card_no}`;
    const cardCont = document.getElementById('card-container');
  }
}
function handleKeyDown(event){
  if (event.key === "ArrowRight" && event.altKey) {
    goToNextDeck();
  } else if(event.key === "ArrowLeft" && event.altKey) {
    backToLastDeck();
  } else if(event.key === "ArrowRight" && event.shiftKey) {
    shiftToBottom();
  } else if (event.key === "ArrowLeft" && event.shiftKey) {
    shiftToTop();
  } else if(event.key === "ArrowLeft" && !event.shiftKey && !event.altKey) {
    if (peekCards >= 0) {
      retract(peekCards);
      peekCards--;
    } 
  } else if(event.key === "ArrowRight" && !event.shiftKey && !event.altKey){
    if(peekCards < 6){
      peekCards++
      peek(peekCards)
    }
 }

}

function peek(peeks) {
  for (let i = peeks, offset = 35, zIndex = 100; i > 0; i--, offset += 35, zIndex++) {
    const card = document.getElementById(`card${cardIndex + i}`);
    const card2 = document.getElementById(`card${cardIndex + i + 1}`);
    card.style.zIndex = `${zIndex + 1}`;
    card2.style.display = `block`;
    card2.style.zIndex = `${zIndex}`;
    const img = card.querySelector('img');
    img.style.position = `absolute`;
    img.style.transform = `translate(${offset}px, 0px)`;
    const cardContainer = document.getElementById("card-container");
    cardContainer.style.transform = `translate(-${offset / 2}px, 0px)`;
  }
}

function retract(peeks) {
  let offset = 35;
  let contOffset = (35 / 2);
  for (let i = peeks, zIndex = 100; i > 0; i--, zIndex++, offset += 35, contOffset -= (35 / 2)) {
    const card = document.getElementById(`card${cardIndex + i}`);
    const card2 = document.getElementById(`card${cardIndex + i + 1}`);
    card.style.zIndex = `${zIndex}`;
    card2.style.zIndex = `${zIndex - 1}`;
    const cardOffset = (offset - 35 <= 0) ? 0 : (offset - 35);
    const img = card.querySelector('img');
    img.style.transform = `translate(${cardOffset}px, 0px)`;
  }
  if (peeks > 0) {
    const cardContainer = document.getElementById("card-container");
    cardContainer.style.transform = `translate(${contOffset}px, 0px)`;
  }
}
function peekHandler(){
    if(peekCards < 6){
      peek(peekCards)
      peekCards++
    }
}
function retractHandler(){
    if (peekCards >= 0) {
      retract(peekCards);
      peekCards--;
    } 
}

function cleanup() {
  clearInterval(intervalId);
  document.getElementById('deck-right').removeEventListener('click', goToNextDeck);
  document.getElementById('deck-left').removeEventListener('click', backToLastDeck);
  document.getElementById('shift-to-top').removeEventListener('click', shiftToTop);
  document.getElementById('shift-to-bottom').removeEventListener('click', shiftToBottom);
  document.getElementById('retract').removeEventListener('click', retractHandler); 
  document.getElementById('peek').removeEventListener('click', peekHandler);
  document.removeEventListener('keydown', handleKeyDown)
  console.log('cleanup');
}
generateDeck(sessionCards, deckIndex);



document.getElementById('finishButton').addEventListener("click", function () {
  cleanup()
  window.location.href = 'simComp.html'
});

export { sessionCards };
