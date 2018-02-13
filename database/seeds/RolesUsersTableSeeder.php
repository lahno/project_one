<?php

use Illuminate\Database\Seeder;

class RolesUsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('roles_users')->insert([
            [
                'user_id' => 1,
                'role_id' => 1
            ],
            [
                'user_id' => 1,
                'role_id' => 2
            ],

        ]);
    }
}
