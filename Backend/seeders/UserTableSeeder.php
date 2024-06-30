<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Crypt;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin = new User([
            'name' => 'Admin',
            'phone_number' => '0000000000',
            'email' => 'admin@admin.com',
            'password' => Crypt::encryptString('12345678'),
            'type' => 'admin',
        ]);

        $admin->save();
    }
}
