let timerElement = document.getElementById('timer');
let initialTime = 60; // Set initial timer value in seconds
let currentTime = initialTime;
let timerInterval;

function updateTimer() {
    currentTime--;
    timerElement.textContent = currentTime;

    if (currentTime <= 0) {
        clearInterval(timerInterval);
        alert("Time's up!");
    }
}

function startTimer() {
    // Prevent multiple intervals running at the same time
    if (!timerInterval) {
        timerInterval = setInterval(updateTimer, 1000); // Update every second
    }
}

function stopTimer() {
    clearInterval(timerInterval);
    timerInterval = null; // Clear the interval id
}

function resetTimer() {
    stopTimer();
    currentTime = initialTime;
    timerElement.textContent = currentTime;
}
