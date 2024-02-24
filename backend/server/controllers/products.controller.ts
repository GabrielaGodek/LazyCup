import { RequestHandler } from 'express'
import { queries } from '../db/db_conn'

export const getProducts: RequestHandler = async (req, res) => {
    try {
        let sql = 'SELECT * FROM products'
        const queryResult = await queries(sql)
        res.json({ success: true, data: queryResult })
    } catch (err) {
        console.log(err)
    }
}
export const getProduct: RequestHandler = async (req, res) => {
    try {
        let id = req.params.id
        let sql = `SELECT * FROM products WHERE id = ${id}`
        const queryResult = await queries(sql)
        res.json({ success: true, data: queryResult })
        
    } catch (err) {
        console.log(err)
    }
}