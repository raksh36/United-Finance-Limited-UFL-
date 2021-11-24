const express = require('express')
const app = express()
const port = 3000

app.post('/aadhar', function(req, res) {
    res.send('Success')
})

app.post('/cibil', function(req,res) {
    res.send({res:between(500,900)})
})

function between(min, max) {  
  return Math.floor(
    Math.random() * (max - min) + min
  )
}

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
