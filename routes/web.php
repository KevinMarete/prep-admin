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

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
