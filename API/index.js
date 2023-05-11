const express=require("express")
const bodyParser=require("body-parser")
const mongoose=require("mongoose")
const dotenv=require("dotenv")

const app=express()

const user = require("./routes/user.js")
const exercises=require("./routes/exercise.js")

PORT=8080
dotenv.config()

async function connect(){
    try{
        mongoose.connect(process.env.MONGO_URL)
        console.log("connected to db")
    }catch(error){
        console.log("error: " + error)
    }
}

connect()

app.use("/user", user)

app.use('/exercises', exercises)

app.use("/", function(req, res){
    res.send("welcome")
})

app.use("*", function(req, res){
    res.send("welcome")
})

app.listen(PORT, ()=>{
    console.log("backend is running")
})