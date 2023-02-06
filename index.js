const dotenv = require('dotenv')
const express = require('express')

const furnitureRouter = require('./routes/furniture-routes')
const categoryRouter = require('./routes/category-routes')
const userRouter = require('./routes/users-routes')
const profileRouter = require('./routes/profile-routes')
//const auth = require('./middelware/auth')
const cors = require('cors');
const connectDB = require('./config/db')

const app = express()


dotenv.config({
    path: "./config/config.env",
});

app.use(cors());
// Connect to database
connectDB();

const api = process.env.API_URL;
// // To accept form data
// app.use(express.urlencoded({ extended: false }))
// To accept json data
app.use(express.json())
// // To serve static files
// app.use(express.static(path.join(__dirname, 'public')))

// app.get('^/$|/index(.html)?', (req, res) => {
//     res.sendFile(path.join(__dirname, 'views', 'index.html'))
// })

app.use(`${api}/users`, userRouter)
//app.use(auth.verifyUser)
app.use(`${api}/furniture`, furnitureRouter)
app.use(`${api}/profile`, profileRouter)
app.use(`${api}/category`, categoryRouter)

// Error handling middleware
app.use((err, req, res, next) => {
    console.log(err.stack)
    if (res.statusCode == 200) res.status(500)
    res.json({ msg: err.message })
})

//Server
app.listen(process.env.PORT || 3000, () => {
    console.log("Server running at http://localhost:3000".yellow.underline.bold);
});


// require('dotenv').config()
// const express = require('express')
// const path = require('path')
// const mongoose = require('mongoose')
// // const logger = require('./logger')
// const furnitureRouter = require('./routes/furniture-routes')
// const categoryRouter = require('./routes/category-routes')
// const userRouter = require('./routes/users-routes')
// const profileRouter = require('./routes/profile-routes')
// //const auth = require('./middelware/auth')

// const app = express()
// const cors = require('cors')
// const port =  3000

// mongoose.connect(`mongodb://127.0.0.1:27017/furniture`)
//     .then(()=>{
//         console.log('Connected')
//         app.listen(port, ()=>{
//             console.log(`App is running on port ${port}`)
//         })
//     }).catch((err)=> console.log(err))

// app.use(
//     "/images",
//     express.static(path.join(__dirname, "images"))
// )

// app.use('/',(req, res, next) => {
//     // logger.log(`${req.method}\t${req.headers.origin}\t${req.path}`)
//     console.log(`${req.method} ${req.path}`)
//     next()
// })
// // To accept form data
// app.use(express.urlencoded({ extended: false }))
// // To accept json data
// app.use(express.json())
// // To serve static files
// // app.use(express.static(path.join(__dirname, 'public')))

// // app.get('^/$|/index(.html)?', (req, res) => {
// //     res.sendFile(path.join(__dirname, 'views', 'index.html'))
// // })

// app.use(cors())

// app.use('/users', userRouter)
// //app.use(auth.verifyUser)
// app.use('/furniture', furnitureRouter)
// app.use('/profile', profileRouter)
// app.use('/categories', categoryRouter)
// // Error handling middleware
// app.use((err, req, res, next) => {
//     console.log(err.stack)
//     if (res.statusCode == 200) res.status(500)
//     res.json({ msg: err.message })
// })

