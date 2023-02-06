const { tr } = require('date-fns/locale')
const mongoose = require('mongoose')

const userSchema = mongoose.Schema({
    fname: {
        type:String
    },
    lname: {
        type:String
    },

    image:{
        type: String,
    },
    gender:{
        type: String,
        required:false
    },
    email : {
        type : String,
        required : true,
        unique :[true, 'This is already registred'],
        minLength : [5, 'Usernames should be longer than 5 characters.']
    },
    password : {
        type : String,
        required : true,
    },
    role : {
        type: String,
        enum : ['User', 'Admin'],
        default : 'User'
    },
    // profile : {
    //     type : mongoose.Schema.Types.ObjectId,
    //     ref : 'Profile'
    // }
}, {timestamps : true})

module.exports = mongoose.model('User', userSchema)