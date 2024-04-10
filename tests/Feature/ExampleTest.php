<?php
use App\Models\User;


it('redirects unauthorized users to the login page', function () {
    // $response = $this->get('/');

    // $response->assertStatus(302);
    // $response->assertRedirect('/login');
    $response = $this
        ->get('/')
        ->assertRedirect('/login');
});

it('allows logged in users to access the main panel', function () {
    $user = User::factory()->create();
    $this->actingAs($user);

    $response = $this->get('/');

    $response->assertStatus(200); 
});
