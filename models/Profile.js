const mongoose = require('mongoose')

const profileSchema = mongoose.Schema({
    fname : {
        type : String,
        required : true
    },
    lname : {
        type : String,
        required : true
    },
    email : {
        type : String,
    },
    image : {
        type : String,
    },
    gender : {
        type : String,
    },
    phone : {
        type : String,
    },
    address : {
        type : String,
    },
    user : {
        type : mongoose.Schema.Types.ObjectId,
        ref : 'User'
    }
})

module.exports = mongoose.model('Profile', profileSchema)