<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;

class Sale
{
    // get avalable date for test
    public static function getSalesDates(){
            return DB::table('sales')
            ->selectRaw('DISTINCT DATE(date) as date')
            ->orderBy('date', 'asc')
            ->pluck('date')
            ->toArray();
    }
    // Define a method to get the top theater for a given date
    public static function getTopTheaterByDate($date)
    {
        return DB::table('sales')
            ->join('theaters', 'sales.theater_id', '=', 'theaters.id')
            ->select('theaters.name', DB::raw('SUM(sales.sales_amount) as total_sales'), DB::raw('COUNT(sales.sales_amount) as counter'))
            ->whereDate('sales.date', $date)
            ->groupBy('sales.theater_id', 'theaters.name')
            ->orderByDesc('total_sales')
            ->first();
    }
}