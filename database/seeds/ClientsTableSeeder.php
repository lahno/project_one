<?php

use Illuminate\Database\Seeder;

class ClientsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('clients')->insert([
            [
                'name' => 'client_1',
                'email' => 'email_1@site.com',
                'phone' => '0930000001'
            ],
            [
                'name' => 'client_2',
                'email' => 'email_2@site.com',
                'phone' => '0930000002'
            ],
            [
                'name' => 'client_3',
                'email' => 'email_3@site.com',
                'phone' => '0930000003'
            ]

        ]);
    }
}
