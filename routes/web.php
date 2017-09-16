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

Route::get('/', 'HomeController@index');

Auth::routes();

Route::get('/home', 'HomeController@home')->name('home');

Route::prefix('cabang')->group(function () {

	Route::get('', function () {
		return view('admin.cabang.index');
	});

	Route::get('add', function () {
		return view('admin.cabang.add');
	});

	Route::get('edit', function () {
		return view('admin.cabang.edit');
	});

});

Route::prefix('produk')->group(function () {

	Route::get('', function () {
		return view('admin.produk.index');
	});

	Route::get('add', function () {
		return view('admin.produk.add');
	});

	Route::get('edit', function () {
		return view('admin.produk.edit');
	});

});

Route::get('profile', function () {
	return view('admin.profile.index');
});

Route::prefix('user')->group(function () {

	Route::get('', function () {
		return view('admin.user.index');
	});

	Route::get('add', function () {
		return view('admin.user.add');
	});

	Route::get('edit', function () {
		return view('admin.user.edit');
	});

});