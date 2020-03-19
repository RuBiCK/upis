# UPIS
## Description
Upload POST Images Server
This is a really simple project with an ESP32 with a tiny cam that takes pictures and send them periodically via POST request to a Flask server that saves the pictures.

## Environment variables

`UPLOAD_FOLDER` = The folder which the pictures will saved. Will be created if it doesn't exist.

`DEBUG` = Show for stdout the files that are being written

`DEBUG_FLASK` = Enable Flask DEBUG
 
`PORT` = Listen port, default 3001
