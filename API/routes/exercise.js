const express=require("express")
const bodyParser=require("body-parser")

const router=express.Router()

router.use(bodyParser.json())
router.use(bodyParser.urlencoded({extended:false}))

const Exercise=require('../models/exerciseModel')

//get exercise data
router.get('/:category', async(req, res)=>{
    console.log("inside exercise get")
    const exCategory=req.params.category
    query={type:exCategory}
   try{
        const exerciseDetails=await Exercise.find(query)
        res.status(200).json({status:200, data:exerciseDetails})
        console.log(exerciseDetails)
   }catch(error){
        res.send("error occured: "+ error)
        console.log(error)
   }
})

// router.post('/', async(req, res)=>{
//     console.log("inside user post")

//     const user=new User()
//     user.name=req.body.name
//     user.age=req.body.age
//     user.gender = req.body.gender
//     user.weight=req.body.weight
//     user.height=req.body.height
//     user.bmi=req.body.bmi
//     user.goal=req.body.goal

//     try{
//        const response= await user.save()
//        console.log(response)
//    }catch(error){
//         res.send("error occured: "+ error)
//         console.log(error)
//    }
// })

module.exports=router