const express=require("express")
const bodyParser=require("body-parser")

const router=express.Router()

router.use(bodyParser.json())
router.use(bodyParser.urlencoded({extended:false}))

const Exercise=require('../models/exerciseModel')


//get exercise data - all
router.get('/', async(req, res)=>{
     console.log("inside exercise get")

    try{
         const exerciseDetails=await Exercise.find()
         res.status(200).json({status:200, data:exerciseDetails})
         console.log(exerciseDetails)
    }catch(error){
         res.send("error occured: "+ error)
         console.log(error)
    }
 })

//get exercise data - type and gender
router.get('/:gender', async(req, res)=>{
    console.log("inside exercise get")
    const exCategory=req.params.type
    const exGender = req.params.gender
    query={gender:exGender}
   try{
        const exerciseDetails=await Exercise.find(query)
        res.status(200).json({status:200, data:exerciseDetails})
        console.log(exerciseDetails)
   }catch(error){
        res.send("error occured: "+ error)
        console.log(error)
   }
})

//get exercise data - day 01 
router.get('/:type/:gender/:category', async(req, res)=>{
     console.log("inside exercise get")
     const exType=req.params.type
     const exGender = req.params.gender
     const exCategory= req.params.category
     query={type:exType, gender:exGender, category:exCategory}
    try{
         const exerciseDetails=await Exercise.find(query)
         res.status(200).json({status:200, data:exerciseDetails})
         console.log(exerciseDetails)
    }catch(error){
         res.send("error occured: "+ error)
         console.log(error)
    }
 })

module.exports=router