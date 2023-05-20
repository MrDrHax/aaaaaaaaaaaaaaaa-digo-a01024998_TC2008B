"use strict"

import express from 'express'
import fs from 'fs'

const app = express()
const port = 3000

app.use(express.json())
app.use(express.static('./public'))

app.get('/', (req, res)=>
{
    fs.readFile('./html/index.html', 'utf8', 
    (err, html) => {
        if(err)
        {
            res.status(500).send('There was an error: ' + err)
            console.log("ERROR: app.get: " + err)
            return 
        }
        
        res.status(200)
        res.send(html)
        console.log("GET")
    })
})

app.get('/api/hello', (req, res)=>
{
    console.log(req.query)
    if(req.query.hasOwnProperty('name') && req.query.hasOwnProperty('surname'))
        res.send(`Hi ${req.query.name} ${req.query.surname}`)
    else
        res.send('This changed!')
})

app.get('/api/greeting/:name/:surname', (req, res)=>{
    console.log(req.params)
    if(req.params.hasOwnProperty('name') && req.params.hasOwnProperty('surname'))
        res.send(`hi ${req.params.name} ${req.params.surname}`)
    else
        res.send('Hello!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})