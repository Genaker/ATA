import { createConnection } from 'mysql2/promise';
import { dbConfig } from '../dbConfig.js';

export const Sale = {
    // Get all available distinct dates
    async getAvailableDates() {
        const connection = await createConnection(dbConfig);
        try {
            const [rows] = await connection.query(`
                SELECT DISTINCT DATE(date) AS date
                FROM sales
                ORDER BY date ASC
            `);
            return rows.map(row => row.date.toISOString().split('T')[0]);
        } finally {
            await connection.end();
        }
    },

    // Get the top-performing theater for a given date
    async getTopTheaterByDate(date) {
        const connection = await createConnection(dbConfig);
        try {
            const [rows] = await connection.query(
                `
                SELECT theaters.name AS theater, SUM(sales.sales_amount) AS total_sales, COUNT(sales.sales_amount) AS counter
                FROM sales
                JOIN theaters ON sales.theater_id = theaters.id
                WHERE DATE(sales.date) = ?
                GROUP BY sales.theater_id, theaters.name
                ORDER BY total_sales DESC
                LIMIT 1
                `,
                [date]
            );
            return rows[0] || null;
        } catch (err) {
            console.log("DB ERROR: " + err);
        }
    
        await connection.end();

    },
};