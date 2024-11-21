<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Sale; // <--- using model to separate data from command. It is not elouqent model. Just a class to manipulate data

class TopTheaterSales extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:top-theater-sales';

    /**
     * The console command description.
     *
     * @var string
     */
   // Command description
   protected $description = 'Find the theater with the highest sales for a given date';

   /**
    * Execute the console command.
    *
    * @return int
    */
   public function handle()
   {
       // Fetch available dates using our model class
       $availableDates = Sale::getSalesDates();

       if (empty($availableDates)) {
           $this->error('No sales data available in the database.');
           return 1;
       }

       // Prompt the user to select a date
       $selectedDate = $this->choice('Select a date to query:', $availableDates);

       // Use or model class to get the top theater for the selected date
       $topTheater = Sale::getTopTheaterByDate($selectedDate);

       if ($topTheater) {
           $this->info("Theater with the most sales on {$selectedDate}: {$topTheater->name} (\${$topTheater->total_sales} in {$topTheater->counter} orders)");
       } else {
           $this->info("No sales data found for the selected date.");
       }

       return 0;
   }
}
