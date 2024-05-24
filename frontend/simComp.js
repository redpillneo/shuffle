import {sessionCards} from './trainingSession.js';

const cardContainer = document.getElementById('card-container')

// function startTimer(display) {
// let timer = 0, minutes, seconds;
//   setInterval(() => {
//       minutes = parseInt(timer / 60, 10);
//       seconds = parseInt(timer % 60, 10);

//       minutes = minutes < 10 ? "0" + minutes : minutes;
//       seconds = seconds < 10 ? "0" + seconds : seconds;

//       display.textContent = minutes + ":" + seconds;

//       // if (--timer < 0) {
//       //     timer = duration;
//       // }
//       timer++
//   }, 1000);
// }

// window.onload = () => {
//   const display = document.getElementById('timer');
//   startTimer(display);
// };

// // function to display the sessionCards
// function generateDeck(sessCard, dIndex){
//   console.log("where is my deck?")
//   for(var i = 1; i <= sessCard[dIndex].length; i++){
//     createCard(sessCard[dIndex][i-1], i)
//   }
// }

// function createCard(card, index){
//   const cardDiv = document.createElement('div')
//   cardDiv.classList.add('card')
//   cardDiv.id = `card${index}`

//   const img = document.createElement('img')
//   // get the image resource of the 
//   img.src = `images/cards/${card.getURL()}.png`

//   cardDiv.appendChild(img)
//   cardContainer.appendChild(cardDiv)
//   displayCard(0)
// }
// function displayCard(index) {
//   const cards = document.querySelectorAll('.card')
//   cards.forEach((card, i) => {
//     card.style.display = (i === index) ? 'block' : 'none';
//   })
// }

// // calls
// generateDeck(sessionCards, 0)