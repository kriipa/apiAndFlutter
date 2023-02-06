const express = require('express')
const router = express.Router()
const furnitureController = require('../controllers/furniture-controller')
const reviewController = require('../controllers/review-controller')
const { verifyUser, verifyManager, verifyAdmin } = require('../middelware/auth')
const multer = require("multer");
const fs = require('fs');
const path = require('path');

// //Validate upload file
// const FILE_TYPE_MAP = {
//     "image/jpeg": "jpeg",
//     "image/png": "png",
//     "image/jpg": "jpg",
// };

// //Upload image to server
// var storage = multer.diskStorage({
//     destination: function (req, file, cb) {
//         const isValid = FILE_TYPE_MAP[file.mimetype];
//         //validate weather the file is a valid image
//         if (!isValid) cb(new Error("Invalid file type"), "./images/user_image");
//         else cb(null, "./images/user_image"); // path where we upload an image
//     },
//     filename: function (req, file, cb) {
//         const extension = FILE_TYPE_MAP[file.mimetype];
//         cb(null, `IMG-${Date.now()}.${extension}`);
//     },
// }); 

// var uploadOptions = multer({ storage: storage });

// router.post(verifyUser,'/furniture', uploadOptions.single("image"), (req, res, next) => {
//     Furniture.findOne({ email: req.body.email })
//         .then(furniture => {
//             if (furniture != null) {
//                 res.status(400)
//                 return next(new Error(`Email ${req.body.email} already exists`))
//             }
//             bcrypt.hash(req.body.password, 10, (err, hash) => {
//                 if (err) next(err)
//                 let furniture = new furniture()
//                 furniture.name = req.body.name
//                 furniture.price = req.body.price
//                 furniture.description=req.body.description
//                 // if (req.body.role) furniture.role = req.body.role
//                 const file = req.file;
//                     // Add image to furniture
//                     if (file) {
//                     const fileName = req.file.filename;
//                         furniture.image = '/images/user_image/' + fileName;
//                     }
//                 furniture.save().then(furniture => {
//                     res.status(200).json({success:true, message: 'Product add success.', data: furniture ,})
//                 }).catch((err) => { res.status(400); next(err) })
//             })
//         }).catch(next)
// })

router.route('/')
    .get(furnitureController.getAllFurniture)
    .post(verifyUser, furnitureController.createFurniture)
    .put((req, res) => res.status(501).json({ 'msg': 'Not implemented' }))
    .delete(verifyAdmin, furnitureController.deleteAllFurniture)

    router.route('/:id')
    .get(furnitureController.getFurnitureById)
    .post((req, res) => res.status(501).json({ 'msg': 'Not implemented' }))
    .put(furnitureController.updateFurnitureById)
    .delete(verifyAdmin, furnitureController.deleteFurnitureById)

router.route('/:id/reviews')
    .get(reviewController.getAllReviews)
    .post(verifyUser,reviewController.createReview)
    .put((req, res) => res.status(501).json({ 'msg': 'Not implemented' }))
    .delete(verifyAdmin, reviewController.deleteAllReviews)

router.route('/:id/reviews/:review_id')
    .get(reviewController.getReviewById)
    .post((req, res) => res.status(501).json({ 'msg': 'Not implemented' }))
    .put(reviewController.updateReviewById)
    .delete(reviewController.deleteReviewById)

module.exports = router