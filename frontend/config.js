document.getElementById("createSessionButton").addEventListener("click", createTrainingSession);

async function createTrainingSession(){
  const deck_no = document.getElementById('deck_no').value
  const card_no = document.getElementById('card_no').value
  const time_mode = document.getElementById('time_mode').value
  const recall_mode = document.getElementById('recall_mode').value

  const data = {
    deck_no: deck_no, 
    card_no: card_no, 
    time_mode: time_mode, 
    recall_mode: recall_mode
  };
  console.log(data)

  const response = await fetch("http://localhost:8080/createConfig", {
    method: "POST",
    body: JSON.stringify(data),
    headers: {"Content-Type": "application/json"}
  });

  const jsonData = await response.json();
  console.log(jsonData)
  sessionStorage.setItem('trainingConfig', JSON.stringify(data));
  console.log("here's the data from config: ", data)
  window.location.href = "trainingSession.html";
}
