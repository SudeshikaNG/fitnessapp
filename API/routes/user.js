const express=require("express")
const bodyParser=require("body-parser")

const router=express.Router()

router.use(bodyParser.json())
router.use(bodyParser.urlencoded({extended:false}))

const User=require('../models/userModel')

//get user data
router.get('/:username/:password', async(req, res)=>{
    console.log("inside user get")
    
    const un=req.params.username
    const pw = req.params.password
    console.log(un)
    console.log(pw)
    query={username:un, password:pw}
   try{
        const userDetails=await User.find(query)
        res.status(200).json({status:200, data:userDetails})
        console.log(userDetails)
   }catch(error){
        res.send("error occured: "+ error)
        console.log(error)
   }
   
})

// //get user data
// router.get('/:id', async(req, res)=>{
//      console.log("inside user get")
     
//      const userId=req.params.id
//      console.log(userId)
//      query={m_id:userId}
//     try{
//          const userDetails=await User.find(query)
//          res.status(200).json({status:200, data:userDetails})
//          console.log(userDetails)
//     }catch(error){
//          res.send("error occured: "+ error)
//          console.log(error)
//     }
    
//  })

router.post('/', async(req, res)=>{
    console.log("inside user post")

    const user=new User()
    user.username=req.body.username
    user.password=req.body.password
    user.name=req.body.name
    user.age=req.body.age
    user.gender = req.body.gender
    user.weight=req.body.weight
    user.height=req.body.height
    user.bmi=req.body.bmi
    user.goal=req.body.goal
    user.m_id=req.body.m_id

    try{
       const response= await user.save()
       console.log(response)
   }catch(error){
        res.send("error occured: "+ error)
        console.log(error)
   }
})

module.exports=router