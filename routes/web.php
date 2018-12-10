<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'PrepFront@index');
Route::get('/user', 'PrepFront@user');
Route::get('/provider', 'PrepFront@provider');
Route::get('/policymaker', 'PrepFront@policymaker');
Route::get('/resources', 'PrepFront@resources');
Route::get('/journeyinkenya', 'PrepFront@journeyinkenya');
Route::get('/riskassessment-tool', 'PrepFront@rast');

Route::post('/sendMail', 'PrepFront@sendMail')->name('email');

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

//Chat Routes
Route::get('/chat', 'ChatsController@index')->middleware('cors');
Route::get('messages', 'ChatsController@fetchMessages');
Route::post('messages', 'ChatsController@sendMessage');
