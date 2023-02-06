const mongoose = require('mongoose')

const categorySchema = mongoose.Schema({
    name : {
        type: String,
        required: [true, 'Category name is required']
        
    },
    furniture: [{
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Furniture'
    }]
})

module.exports = mongoose.model('Category', categorySchema)