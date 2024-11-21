import * as dotenv from 'dotenv';
import { env } from 'process';

dotenv.config({ path: './.env' });

export const dbConfig = {
    host: env.DB_HOST.replace(":3306", ""),
    user: env.DB_USERNAME,
    password: env.DB_PASSWORD,
    database: env.DB_DATABASE,
};