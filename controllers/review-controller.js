const Furniture = require('../models/Furniture')

const getAllReviews = (req, res, next) => {
    Furniture.findById(req.params.id)
    .then((furniture) => {
        res.json(furniture.reviews)
    }).catch(next)
}

const createReview = (req, res, next) => {
    Furniture.findById(req.params.id)
    .then((furniture) => {
        furniture.reviews.push(req.body)
        furniture.save()
            .then((p) => res.status(201).json(p.reviews))
    }).catch(next)
}

const deleteAllReviews = (req, res, next) => {
    Furniture.findById(req.params.id)
        .then((furniture) => {
            furniture.reviews = []
            furniture.save()
                .then(p => res.json(p.reviews))
        }).catch(next)
}

const getReviewById = (req, res, next) => {
    Furniture.findById(req.params.id) 
        .then((furniture) => {
            let review = furniture.reviews
                .find((item) => item.id == req.params.review_id)
            res.json(review)
        }).catch(next)
}

const updateReviewById = (req, res, next) => {
    Furniture.findById(req.params.id)
        .then(furniture => {
            let updatedReviews = furniture.reviews.map((item) => {
                if(item.id == req.params.review_id){
                    item.body = req.body.body //one body from schema
                }
                return item
            })
            furniture.reviews = updatedReviews
            furniture.save().then(p => res.json(p.reviews))
        }).catch(next)
}

const deleteReviewById = (req, res, next) => {
    Furniture.findById(req.params.id)
        .then(furniture => {
            let deletedReviews = furniture.reviews.filter((item) => {
                return item.id != req.params.review_id
            })
            furniture.reviews = deletedReviews
            furniture.save().then(p => res.json(p.reviews))
        }).catch(next)
}

module.exports = {
    getAllReviews,
    createReview,
    deleteAllReviews,
    getReviewById,
    updateReviewById,
    deleteReviewById
}