const mongoose = require('mongoose')
const Catergory = require('./Category')

const reviewsSchema = mongoose.Schema({
    body: {
        type : String,
        required : true
    },
    date: {
        type : String,
        default : Date.now
    },
    reviewer: {
        type : mongoose.Schema.Types.ObjectId,
        ref : 'User'
    }
})

const furnitureSchema =  mongoose.Schema({
    name : {
        type : String,
        required : true
    },
    price : {
        type : String,
        required : true
    },
    description : {
        type : String,
        required : true
    },
    image: {
        type: String,
        // required: true
    },
    woodType: {
        type: String,
    },
    
    reviews: [reviewsSchema],
    category : {
        type: mongoose.Schema.Types.ObjectId,
        ref : 'Category'
    },
    createdAt: {
        type: Date,
        default: Date.now 
    },
    updatedAt: {
        type: Date,
        default: Date.now
    }
}, { timestamps : true })

module.exports = mongoose.model('Furniture', furnitureSchema)