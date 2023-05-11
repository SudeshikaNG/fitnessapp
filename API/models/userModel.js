const mongoose=require("mongoose")

//var Schema=mongoose.Schema
// ObjectId=Schema.ObjectId

const userSchema=new mongoose.Schema({
    name:{
        type:String,
        required:true
    },
	age:{
        type:Number,
        required:true
    },
    gender:{
        type:String,
        required:true
    },
	weight:{
        type:Number,
        required:true
    },
    height:{
        type:Number,
        required:true
    },
    bmi:{
        type:Number,
        required:true
    },
    goal:{
        type:String,
        required:true
    }
}
,{ collection: 'user_details' })

module.exports=mongoose.model('User', userSchema)
