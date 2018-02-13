<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->call(UsersTableSeeder::class);
        $this->call(RolesTableSeeder::class);
        $this->call(RolesUsersTableSeeder::class);
        $this->call(ServicesTableSeeder::class);
        $this->call(StatusOrdersTableSeeder::class);
        $this->call(ClientsTableSeeder::class);
        $this->call(OrdersTableSeeder::class);
        $this->call(ClientOrdersTableSeeder::class);

        $this->call(PagesTableSeeder::class);
        $this->call(CategoryArticlesTableSeeder::class);
        $this->call(CategoryPortfoliosTableSeeder::class);
        $this->call(ArticlesTableSeeder::class);
        $this->call(PortfoliosTableSeeder::class);
        $this->call(ReviewsTableSeeder::class);
    }
}
