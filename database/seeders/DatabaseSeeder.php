<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Seed data for theaters
        DB::table('theaters')->insert([
            ['name' => 'Theater 1', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Theater 2', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Theater 3', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Theater 4', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Theater New', 'created_at' => now(), 'updated_at' => now()],
        ]);

        // Seed data for movies
        DB::table('movies')->insert([
            ['title' => 'Movie 1', 'created_at' => now(), 'updated_at' => now()],
            ['title' => 'Movie 2', 'created_at' => now(), 'updated_at' => now()],
            ['title' => 'Movie 3', 'created_at' => now(), 'updated_at' => now()],
            ['title' => 'Movie 4', 'created_at' => now(), 'updated_at' => now()],
        ]);

        // Seed data for sales
        DB::table('sales')->insert([
            ['theater_id' => 1, 'movie_id' => 1, 'date' => '2024-05-09', 'sales_amount' => 100, 'created_at' => now(), 'updated_at' => now()],
            ['theater_id' => 2, 'movie_id' => 1, 'date' => '2024-05-09', 'sales_amount' => 200, 'created_at' => now(), 'updated_at' => now()],
            ['theater_id' => 1, 'movie_id' => 2, 'date' => '2024-05-09', 'sales_amount' => 150, 'created_at' => now(), 'updated_at' => now()],
            ['theater_id' => 2, 'movie_id' => 2, 'date' => '2024-05-09', 'sales_amount' => 250, 'created_at' => now(), 'updated_at' => now()],
            ['theater_id' => 1, 'movie_id' => 1, 'date' => '2024-05-10', 'sales_amount' => 120, 'created_at' => now(), 'updated_at' => now()],
            ['theater_id' => 2, 'movie_id' => 1, 'date' => '2024-05-10', 'sales_amount' => 220, 'created_at' => now(), 'updated_at' => now()],
            ['theater_id' => 1, 'movie_id' => 2, 'date' => '2024-05-10', 'sales_amount' => 180, 'created_at' => now(), 'updated_at' => now()],
            ['theater_id' => 2, 'movie_id' => 2, 'date' => '2024-05-10', 'sales_amount' => 280, 'created_at' => now(), 'updated_at' => now()],
        ]);
    }
}
