// const mongoose = require("mongoose");

// const cartItemSchema = new mongoose.Schema({
//     //  user who added it to their cart,
//     user: {
//         type: mongoose.Schema.Types.ObjectId,
//         ref: "User",
//         required: true
//     },
//     furniture: {
//         type: mongoose.Schema.Types.ObjectId,
//         ref: "Furniture",
//         required: true
//     },
//     quantity: {
//         type: Number,
//         required: true
//     },
//     createdAt: {
//         type: Date,
//         default: Date.now
//     },
//     updatedAt: {
//         type: Date,
//         default: Date.now
//     }
// });

// module.exports = mongoose.model("CartItem", cartItemSchema);