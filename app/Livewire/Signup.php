<?php

namespace App\Livewire;

use App\Models\User;
use Livewire\Component;

class Signup extends Component
{
    public $name, $email, $password;

    public function render()
    {
        return view('livewire.signup');
    }

    public function register()
    {
        $validatedData = $this->validate([
            'name' => 'required|min:6',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6'
        ]);
        User::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => bcrypt($validatedData['password'])
        ]);
    }
}
