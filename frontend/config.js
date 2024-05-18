document.getElementById("createSessionButton").addEventListener("click", createTrainingSession);

async function createTrainingSession(){
  const deck_no = document.getElementById('deck_no').value
  const card_no = document.getElementById('card_no').value
  const time_mode = document.getElementById('time_mode').value
  const recall_mode = document.getElementById('recall_mode').value

  console.log(deck_no)
  console.log(card_no)
  console.log(time_mode)
  console.log(recall_mode)

}