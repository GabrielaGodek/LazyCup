import express, { Express, Request, Response } from 'express'
import dotenv from 'dotenv'
import cors from 'cors'

import { getProducts, getProduct } from './controllers/products.controller'

dotenv.config();

const port = process.env.PORT || 3000;
const app: Express = express()

app.use(express.json())
app.use(express.urlencoded())
app.use(cors())

app.get('/api/products', getProducts)
app.get('/api/products/:id', getProduct)
app.get('/', (_req: Request, res: Response) => {
    res.json({ message: 'hello' })
})

app.listen(port, () => {
    console.log(`Server running on ${port}`)
})
