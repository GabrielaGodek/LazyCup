import { createPool, PoolOptions } from 'mysql2/promise';

const dbPort: number = parseInt(process.env.DB_PORT || '3306');

const accessData: PoolOptions = {
    host: process.env.DB_HOST || '127.0.0.1',
    port: dbPort,
    user: process.env.DB_USER || 'admin',
    password: process.env.DB_PASSWORD || 'admin',
    database: process.env.DB_DATABASE || 'lazycoffees'
}

export const conn = createPool(accessData);