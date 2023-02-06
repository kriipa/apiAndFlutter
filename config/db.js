const mongoose = require('mongoose');

require('colors');
// Mongoose will ensure that only the fields that are specified in your Schema will be saved in the database,
// and all other fields will not be saved
mongoose.set('strictQuery',true);
const connectDB = async () => {
    const conn = await mongoose.connect(`mongodb://127.0.0.1:27017/furniture`)
    console.log('Connected')}


module.exports = connectDB;