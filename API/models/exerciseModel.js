const mongoose=require("mongoose")

//var Schema=mongoose.Schema
// ObjectId=Schema.ObjectId

const exerciseSchema=new mongoose.Schema({
    name:{
        type:String,
        required:true
    },
	reps:{
        type:Number,
        required:true
    },
    category:{
        type:String,
        required:true
    },
    time:{
        type:Number,
        required:true
    },
    videoLink:{
        type:String,
        required:true
    },
    image:{
        type:String,
        required:true
    },
    effPart:{
        type:String,
        require:true
    }
}
,{ collection: 'exercises' })

module.exports=mongoose.model('Exercises', exerciseSchema)
