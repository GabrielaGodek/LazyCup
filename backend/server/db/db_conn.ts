import { createPool, PoolOptions } from 'mysql2/promise';

const dbPort: number = parseInt(process.env.DB_PORT || '3306');

const accessData: PoolOptions = {
    host: process.env.DB_HOST || '127.0.0.1',
    port: dbPort,
    user: process.env.DB_USER || 'lazycupadmin',
    password: process.env.DB_PASSWORD || 'password',
    database: process.env.DB_DATABASE || 'lazycoffees'
}

export const pool = createPool(accessData);

export async function queries(query: string, values?: any[]): Promise<any> {
    let connection;
    try {
        connection = await pool.getConnection();
        console.log('Connected to MySQL database');

        const [rows, fields] = await connection.execute(query, values);
        // console.log(rows)
        // console.log(fields)
        return rows;
    } catch (error) {
        // console.log('Connected failed');
        console.error('Error executing query:', error);
        throw error;
    } finally {
        if (connection) {
            connection.release();
        }
    }
}