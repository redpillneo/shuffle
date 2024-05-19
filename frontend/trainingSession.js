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

console.log("welcome to training session!")
// creation of cards
const sessionCards = []
console.log(deck_no)
console.log(card_no)

// var deck = []
// var randomCard = pickRandomCard(standard_deck)

// while(!(isCardInDeck(randomCard, deck))){
//   console.log("not in here")
//   deck.push(randomCard)
// }
// console.log("now it's there")


// if(!(isCardInDeck(randomCard, deck))){
//   console.log("haha")
// }

for(var i = 1; i <= deck_no; i++){
  var deck = []
  for(var j = i; j <= card_no; j++){
    var randomCard = pickRandomCard(standard_deck)
    while(isCardInDeck(randomCard, deck)){
      randomCard = pickRandomCard(standard_deck)
    }
    deck.push(randomCard)
  }
  sessionCards.push(deck)
}
for(var i = 1; i <= sessionCards.length; i++){
  for(var j = 1; j <= sessionCards[i-1].length; j++){
    console.log(sessionCards[i-1][j-1].getName())
  }
}

// timer
function startTimer(display) {
let timer = 0, minutes, seconds;
  setInterval(() => {
      minutes = parseInt(timer / 60, 10);
      seconds = parseInt(timer % 60, 10);

      minutes = minutes < 10 ? "0" + minutes : minutes;
      seconds = seconds < 10 ? "0" + seconds : seconds;

      display.textContent = minutes + ":" + seconds;

      // if (--timer < 0) {
      //     timer = duration;
      // }
      timer++
  }, 1000);
}

window.onload = () => {
  const display = document.getElementById('timer');
  startTimer(display);
};



// for(var i = 1; i <= deck_no; i++){
//   console.log("deck ", i)
//   var deck = []
//   for(var j = 1; j <= card_no; j++){  
//     console.log("im here")
//     while(!(isCardInDeck(randomCard, deck))){
//       var randomCard = pickRandomCard(standard_deck)
//     }
//     deck.push(randomCard)
//     console.log("card ", j)
//   }
//   sessionCards.push(deck)
//   console.log("generating cards done!")
// }






