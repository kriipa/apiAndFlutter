const express = require('express')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const User = require('../models/User')
const multer = require("multer");
const fs = require('fs');
const path = require('path');

const router = express.Router()

//Validate upload file
const FILE_TYPE_MAP = {
    "image/jpeg": "jpeg",
    "image/png": "png",
    "image/jpg": "jpg",
};

//Upload image to server
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        const isValid = FILE_TYPE_MAP[file.mimetype];
        //validate weather the file is a valid image
        if (!isValid) cb(new Error("Invalid file type"), "./images/user_image");
        else cb(null, "./images/user_image"); // path where we upload an image
    },
    filename: function (req, file, cb) {
        const extension = FILE_TYPE_MAP[file.mimetype];
        cb(null, `IMG-${Date.now()}.${extension}`);
    },
}); 

var uploadOptions = multer({ storage: storage });

router.post('/register', uploadOptions.single("image"), (req, res, next) => {
    User.findOne({ email: req.body.email })
        .then(user => {
            if (user != null) {
                res.status(400)
                return next(new Error(`Email ${req.body.email} already exists`))
            }
            bcrypt.hash(req.body.password, 10, (err, hash) => {
                if (err) next(err)
                let user = new User()
                user.fname = req.body.fname
                user.lname = req.body.lname
                user.gender=req.body.gender
                if (req.body.role) user.role = req.body.role
                user.email = req.body.email
                user.password = hash
                const file = req.file;
                    // Add image to user
                    if (file) {
                    const fileName = req.file.filename;
                        user.image = '/images/user_image/' + fileName;
                    }
                user.save().then(user => {
                    res.status(200).json({success:true, message: 'User registration success.', data: user ,})
                }).catch((err) => { res.status(400); next(err) })
            })
        }).catch(next)
})

router.post('/login', (req, res, next) => {
    User.findOne({ email: req.body.email })
        .then(user => {
            if (user == null) {
                res.status(401)
                return next(new Error(User `${req.body.email} has not registered.`))
            }
            bcrypt.compare(req.body.password, user.password, (err, status) => {
                if (err) return next(err)
                if (!status) {
                    res.status(401)
                    return next(new Error('Password does not match!'))
                }
                data = {
                    id: user._id,
                    email: user.email,
                    role: user.role
                }
                const token = jwt.sign(data,
                    process.env.SECRET, { expiresIn: '1d' })
                res.json({ status: 'Login Success', token: token })
            })
        }).catch(next)
})


module.exports = router


// const express = require('express')
// const bcrypt = require('bcryptjs')
// const jwt = require('jsonwebtoken')
// const User = require('../models/User')
// const multer = require("multer");
// const fs = require('fs');
// const path = require('path');


// const router = express.Router()

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

// router.post('/', uploadOptions.single("image"), (req, res, next) => {
//     User.findOne({ email: req.body.email })
//         .then(user => {
//             if (user != null) {
//                 res.status(400)
//                 return next(new Error(`Email ${req.body.email} already exists`))
//             }
//             // bcrypt.hash(req.body.password, 10, (err, hash) => {
//             //     if (err) next(err)
//             //     let user = new User()
//             //     user.username = req.body.username
//             //     if (req.body.role) user.role = req.body.role
//             //     user.password = hash
//             //     user.save().then(user => {
//             //         data = {
//             //             id: user._id,
//             //             username: user.username,
//             //             role: user.role
//             //         }
//             //         res.status(201).json({ status: 'User registration success.', data })
//             //     }).catch((err) => { res.status(400); next(err) })

//             bcrypt.hash(req.body.password, 10,(err,hash) => {
//                 if(err) return next(err)
//                 user = new User ()
//                 user.fname = req.body.fname
//                 user.lname = req.body.lname
//                 user.email = req.body.email
//                 user.email = req.body.email
//                 user.password = hash
//                 if(req.body.role)user.role = req.body.role
//                 user.save().then(user => {
//                     res.status(201).json({
//                         status:'User registration success',
//                         userId: user._id,
//                         fname: user.fname,
//                         lname: user.lname,
//                         email: user.email,
//                         email: user.email,
//                         role: user.role
//                     })
//                     const file = req.file;
//                     // Add image to user
//                     if (file) {
//                     const fileName = req.file.filename;
//                         User.image = '/images/user_image/' + fileName;
//                     }
//                 }).catch(next)
//                 // 
//             })
//         }).catch(next)
// })

// router.post('/login', (req, res, next) => {
//     User.findOne({ email: req.body.email })
//         .then(user => {
//             if (user == null) {
//                 res.status(401)
//                 return next(new Error(`User ${req.body.email} has not registered.`))
//             }
//             bcrypt.compare(req.body.password, user.password, (err, status) => {
//                 if (err) return next(err)
//                 if (!status) {
//                     res.status(401)
//                     return next(new Error('Password does not match!'))
//                 }
//                 data = {
//                     id: user._id,
//                     email: user.email,
//                     role: user.role
//                 }
//                 const token = jwt.sign(data,
//                     process.env.SECRET, { expiresIn: '1h' })
//                 res.json({ status: 'Login Success', token: token })
//             })
//         }).catch(next)
// })





// //register user




// module.exports = router