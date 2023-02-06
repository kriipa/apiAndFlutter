const Furniture = require('../models/Furniture');
const Category = require('../models/Category');


const getAllFurniture = (req, res, next) => {
    Furniture.find()
        .then((furniture) => {
            res.json({
                success: true,
                message: 'All the furniture',
                data: furniture
            })
        }).catch(next)
}


const createFurniture = (req, res, next) => {
    let furniture = new Furniture()
    furniture.name= req.body.name,
    furniture.price= req.body.price,
    furniture.description= req.body.description
    furniture.category = req.body.category
    furniture.woodType = req.body.woodType
                    const file = req.file;
                        // Add image to user
                        if (file) {
                        const fileName = req.file.filename;
                        furniture.image = '/images/product_image/' + fileName;
                        }
                        
                        furniture.save().then(furniture => {
                            Category.findById({_id:req.body.category})
                            .then( (category) => {
                                category.furniture.push(furniture._id)
                                category.save()
                            })

                    res.status(200).json({success:true, message: 'Furniture created succesfully', data: furniture})
                }).catch((err) => { res.status(400); next(err) })

}

const deleteAllFurniture = (req, res, next) => {
    Furniture.deleteMany()
        .then((status) => {
            res.status(200).json({success:true, message: 'Furniture deleted succesfully', data: status})
        }).catch((err)=>next(err))
}

const getFurnitureById = (req, res, next) => {
    Furniture.findById(req.params.id)
        .populate('category')
        .then((furniture) => {
            res.status(200).json({success:true, message: 'Furniture by id succesfully received', data: furniture})
        }).catch((err)=>next(err))
}

const updateFurnitureById = (req, res, next) => {
    Furniture.findById(req.params.id)
        .then(furniture => {

            furniture.name = req.body.name ? req.body.name : furniture.name
            furniture.price = req.body.name ? req.body.name : furniture.name
            // book.category = req.body.category ? req.body.category : book.category
            furniture.save().then(furniture => res.status(200).json({success:true, message: 'Furniture by id updated succesfully', data: furniture})).catch((err)=>next(err))
        }).catch(next)
}

const deleteFurnitureById = (req, res, next) => {
    Furniture.findByIdAndDelete(req.params.id)
        .then((furniture) => {
            res.status(200).json({success:true, message: 'Furniture by id succesfully deleted', data: furniture})
        }).catch(next)
}

module.exports = {
    getAllFurniture,
    createFurniture,
    deleteAllFurniture,
    getFurnitureById,
    updateFurnitureById,
    deleteFurnitureById
}

// const Furniture = require('../models/Furniture');

// const getAllFurniture = (req, res, next) => {
//     Furniture.find()
//         .then((furnitures) => {
//             res.json(furnitures)
//         }).catch(next)
// }

// const createFurniture = (req, res, next) => {
//     let furniture = {
//         name: req.body.name,
//         price: req.body.price,
//         // owner: req.user.id,
//         description: req.body.description,
//         category: req.body.category,
//         image: req.body.image
//     }
//     Furniture.create(furniture)
//         .then((furniture) => {
//             res.status(201).json(furniture)
//         }).catch(next)
// }

// const deleteAllFurniture = (req, res, next) => {
//     Furniture.deleteMany()
//         .then((status) => {
//             res.json(status)
//         }).catch(next)
// }

// const getFurnitureById = (req, res, next) => {
//     Furniture.findById(req.params.id)
//         .populate('category')
//         .then((furniture) => {
//             res.json(furniture)
//         }).catch(next)
// }

// const updateFurnitureById = (req, res, next) => {
//     Furniture.findById(req.params.id)
//         .then(furniture => {
//             if (furniture.owner != req.user.id) {
//                 res.status(403)
//                 return next(new Error('Not allowed'))
//             }
//             furniture.name = req.body.name ? req.body.name : furniture.name
//             furniture.price = req.body.name ? req.body.name : furniture.name
//             // book.category = req.body.category ? req.body.category : book.category
//             furniture.save().then(furniture => res.json(furniture)).catch(next)
//         }).catch(next)
// }

// const deleteFurnitureById = (req, res, next) => {
//     Furniture.findByIdAndDelete(req.params.id)
//         .then((furniture) => {
//             res.json(furniture)
//         }).catch(next)
// }

// module.exports = {
//     getAllFurniture,
//     createFurniture,
//     deleteAllFurniture,
//     getFurnitureById,
//     updateFurnitureById,
//     deleteFurnitureById
// }