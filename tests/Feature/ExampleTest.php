<?php
use App\Models\User;



// it('returns a successful response', function () {
//     $response = $this->get('/');

//     $response->assertStatus(200);
// });

it('redirects unauthorized users to the login page', function () {
    $response = $this->get('/');

    $response->assertStatus(302);
    $response->assertRedirect('/login');
});

it('allows logged in users to access the main panel', function () {
    $user = User::factory()->create();
    $this->actingAs($user);

    $admin = User::find(Auth::id());
    $this->actingAs($admin);

    $this->withoutExceptionHandling();
    $response = $this->get('/');

    
    $response->assertStatus(200); 
});
