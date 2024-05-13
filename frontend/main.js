const { app, BrowserWindow } = require('electron')

require('electron-reload')(__dirname);

const createWindow = () => {
  const win = new BrowserWindow({
    width: 800,
    height: 600
  })
  win.loadFile('index.html')
}

app.whenReady().then(() => {
  createWindow()
})