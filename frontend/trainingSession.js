function getStoredData() {
  const data = sessionStorage.getItem('trainingConfig');
  return data ? JSON.parse(data) : {};
}

const data = getStoredData()
console.log(data)

const {deck_no, card_no, time_mode, recall_mode} = data

