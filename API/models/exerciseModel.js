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
        type:Number
    },
    video:{
        type:video,
        required:true
    },
    effectivePart:{
        data:Buffer,
        type:String,
        required:true
    }	
}
,{ collection: 'exercises' })

module.exports=mongoose.model('Exercises', exerciseSchema)
