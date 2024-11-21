import inquirer from 'inquirer';
import { Sale } from './models/Sale.js';

async function main() {
    try {
        // Fetch available dates from the Sale model
        const availableDates = await Sale.getAvailableDates();

        if (availableDates.length === 0) {
            console.log('No sales data available in the database.');
            return;
        }

        // Prompt the user to select a date
        const { selectedDate } = await inquirer.prompt([
            {
                type: 'list',
                name: 'selectedDate',
                message: 'Select a date to query:',
                choices: availableDates,
            },
        ]);

        // Fetch the top-performing theater for the selected date
        const topTheater = await Sale.getTopTheaterByDate(selectedDate);

        if (topTheater) {
            console.log(
                `Theater with the most sales on ${selectedDate}: ${topTheater.theater} (\$${topTheater.total_sales} sales in ${topTheater.counter} orders)`
            );
        } else {
            console.log(`No sales data found for the selected date.`);
        }
    } catch (error) {
        console.error('Error:', error.message);
    }
}

main();
