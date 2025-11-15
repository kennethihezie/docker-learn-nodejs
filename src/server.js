require('dotenv').config();
const express = require('express')
const app = express()

app.get('/', (req, res) => {
    console.log("Incoming Request");
    res.send('Hello learning docker')
}) 

app.listen(process.env.PORT, () => {
    console.log(`http://localhost:${process.env.PORT}`);
    console.log(`Server is running on port: ${process.env.PORT}`)
})